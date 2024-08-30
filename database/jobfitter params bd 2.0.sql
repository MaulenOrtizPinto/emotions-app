-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para jobfitter
CREATE DATABASE IF NOT EXISTS `jobfitter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jobfitter`;

-- Volcando estructura para tabla jobfitter.clusters
CREATE TABLE IF NOT EXISTS `clusters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla jobfitter.clusters: ~4 rows (aproximadamente)
INSERT INTO `clusters` (`id`, `cluster_name`) VALUES
	(1, 'extrovertido'),
	(2, 'determinado'),
	(3, 'estructurado'),
	(4, 'creativo'),
	(5, 'racional');

-- Volcando estructura para tabla jobfitter.cluster_params
CREATE TABLE IF NOT EXISTS `cluster_params` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cluster_id` int NOT NULL,
  `emotion_id` int NOT NULL,
  `peak_limits` int DEFAULT NULL,
  `value_limit` double DEFAULT NULL,
  `level` text,
  PRIMARY KEY (`id`),
  KEY `cluster_id` (`cluster_id`),
  KEY `emotion_id` (`emotion_id`),
  CONSTRAINT `cluster_params_ibfk_1` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`id`),
  CONSTRAINT `cluster_params_ibfk_2` FOREIGN KEY (`emotion_id`) REFERENCES `emotions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla jobfitter.cluster_params: ~24 rows (aproximadamente)
INSERT INTO `cluster_params` (`id`, `cluster_id`, `emotion_id`, `peak_limits`, `value_limit`, `level`) VALUES
	(1, 1, 1, 3, 30, 'alto'),
	(2, 1, 1, 1, 30, 'medio'),
	(3, 1, 1, 0, 30, 'bajo'),
	(4, 2, 2, 2, 60, 'alto'),
	(5, 2, 3, 2, 60, 'alto'),
	(6, 2, 2, 2, 32, 'medio'),
	(7, 2, 3, 2, 50, 'medio'),
	(8, 2, 2, 2, 60, 'bajo'),
	(9, 2, 3, 2, 50, 'bajo'),
	(10, 3, 4, 3, 20, 'alto'),
	(11, 3, 6, 3, 20, 'alto'),
	(12, 3, 4, 1, 30, 'medio'),
	(13, 3, 6, 1, 30, 'medio'),
	(14, 3, 4, 4, 80, 'bajo'),
	(15, 3, 6, 2, 20, 'bajo'),
	(16, 4, 5, 3, 20, 'alto'),
	(17, 4, 5, 1, 20, 'medio'),
	(18, 4, 5, 0, 20, 'bajo'),
	(19, 5, 4, 10, 80, 'alto'),
	(20, 5, 6, 3, 50, 'alto'),
	(21, 5, 4, 10, 80, 'medio'),
	(22, 5, 6, 3, 50, 'medio'),
	(23, 5, 4, 9, 80, 'bajo'),
	(24, 5, 6, 2, 50, 'bajo');

-- Volcando estructura para tabla jobfitter.cluster_texts
CREATE TABLE IF NOT EXISTS `cluster_texts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(50) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `text` text,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla jobfitter.cluster_texts: ~21 rows (aproximadamente)
INSERT INTO `cluster_texts` (`id`, `cluster_name`, `level`, `text`, `status`) VALUES
	(1, 'extrovertido', 'alto', 'Se caracteriza por su alto nivel de extroversión. Es una persona a la que se le da "fácil" la interacción con otros, sean éstos compañeros antiguos o nuevos. Es de aquellas que no pasa desapercibida. Su forma de vincularse es directa, espontánea y fluida. Busca activamente la generación de nuevas amistades y se siente cómoda en eventos sociales. En el ámbito laboral, prefiere aquellos trabajos donde la clave está en el equipo y en el que existan instancias para exponer sus ideas e interactuar continuamente con otros colaboradores. Suele ser un buen aporte a los equipos. En contrapartida, no se siente a gusto en emprendimientos o aventuras solitarias o diseñando proyectos sin contar con un apoyo o con la retroalimentación continua de los demás. Destaca también por ser una persona empática y emocionalmente "conectada". Editado', 1),
	(2, 'extrovertido', 'medio', 'Esta persona interactúa normalmente con otros. Logra adaptarse bien a los contextos sociales y organizacionales: cuando hay que conocer nuevas personas, se acerca tranquilamente, escucha y luego se presenta y conversa de manera normal. También se siente cómoda en instancias más solitarias o de introspección, las que ocasionalmente busca para "ordenar sus emociones e ideas". Se adapta bien a los trabajos: pondrá especial atención a los estilos de personalidad de aquellos que lo rodean y logrará generar vínculos fácilmente con los más parecidos y pondrá atención respecto a los que manifiestan mucha extroversión, a quiénes podría tratar de ganarlos buscando aspectos en común.', 1),
	(3, 'extrovertido', 'bajo', 'Esta persona se caracteriza por ser estructuralmente introvertida. Esto significa que en su infancia podría haber sido alguien más bien retraída o tímida. No significa que actualmente sea introvertida o socialmente cohibida, pero tal vez su estilo relacional no es del todo fluido: suele  racionalizar la interacción y “calcula” u observa con cuidado los contextos antes de actuar o decir algo. Cuando ya logra la confianza -algo que suele suceder después de varias aproximaciones-, podría soltarse y actuar de manera más desinhibida o fluida. En el largo plazo, suele ser de pocos, pero buenos amigos, los que podría mantenerlos por muchísimo tiempo. Prefiere reuniones familiares pequeñas (con pocas personas) o instancias de juntas en casa con pocas personas, antes que las fiestas. En términos laborales, se siente cómoda en trabajos donde tenga que interactuar con pocas personas o incluso, en aquellos proyectos individuales donde sea necesario trabajar en solitario. Aunque logra adaptarse a distintos contextos, prefiere aquellos trabajos remotos o de modalidad híbrida. Para esta persona, los espacios personales son de alta relevancia: necesita de la introspección, o de la meditación o de simples caminatas por un parque escuchando su música favorita.', 1),
	(4, 'determinado', 'alto', 'Se caracteriza por ser una persona altamente determinada. Aunque podría ser vista como alguien de ideas fijas, lo cierto es que en su mente las ideas se manifiestan con claridad, y eso es lo que la lleva a “empujar” y movilizar en dirección a esa meta. Le gusta ir testeando y probando los caminos alternativos que podrían conducir al resultado esperado. A veces podría llegar a parecer obstinada cuando quiere conseguir algo: si se le presenta un obstáculo difícil de superar, podría llevar a cabo acciones que algunos podrían considerar arriesgadas. Sin embargo, su fuerte determinación no siempre la lleva a arriesgarse, muy por el contrario: en su afán por lograr lo que quiere, podría llegar a ser muy meticulosa en los cálculos y consideraciones necesarias para disminuir el riesgo de no llegar a la meta. En términos laborales, suele ser una persona a la que se le dan más facil los roles de liderazgo que de subalterno. Suele llevarse mejor con aquellos jefes que manifiestan flexibilidad y apertura al cambio. En contrapartida, es posible que llegue a no adaptarse con jefes que manifiestan rigidez en sus planteamientos. En estos casos, esta persona tenderá a cuestionar algunas directrices fundamentales. Puede que uno de los principales desafíos de esta persona sea justamente la de ponderar riesgos en las decisiones tomadas: en la medida que logre tener claridad de su "matriz de riesgo" y tome acciones en concordancia, podrá llegar a las tan deseadas metas. ', 1),
	(5, 'determinado', 'medio', 'Es una persona relativamente determinada en su actuar. Suele considerar y analizar siempre los contextos y circunstancias. Muestra flexibilidad en sus planteamientos, especialmente cuando percibe contextos de incertidumbre. Sin embargo, cuando los escenarios le resultan más claros, sus propuestas y decisiones son sólidas y concisas. Respecto a su desempeño laboral, tiene una alta probabilidad de adaptarse a diversos escenarios y a distintos estilos de jefatura. Por ejemplo, frente a jefes muy determinados, manifestará una mayor condescendencia, sin dejar de exponer sus puntos de vista, sobre todo cuando se da cuenta que tras la decisión existen riesgos relevantes. Con las personas que tendrá a su cargo, logrará mantener buenas relaciones y se adaptará al estilo de cada uno, evitando que aquellos más obstinados terminen imponiendo sus puntos de vista.', 1),
	(6, 'determinado', 'bajo', 'Esta persona en la Vida Diaria manifestaría las siguientes conductas: Dificultad para elegir: Le cuesta tomar decisiones simples, como qué ropa ponerse o qué comer, hasta las más importantes, como elegir una carrera o mudarse. Procrastinación: Tendencia a posponer tareas y decisiones importantes, ya que les genera ansiedad y estrés el tener que tomar una decisión. Indecisión: Cambian constantemente de opinión y tienen dificultades para mantener una postura firme. Miedo al error: Evitan tomar decisiones por temor a equivocarse y a las consecuencias negativas que esto pueda traer. Influencia externa: Se dejan influenciar fácilmente por las opiniones de los demás y tienen dificultades para confiar en su propio juicio. Baja autoestima: Dudan de sus capacidades y habilidades para tomar buenas decisiones. En la Vida Laboral podría manifestar: Dificultad para establecer metas: Les cuesta definir objetivos claros y realistas, lo que dificulta su desarrollo profesional. Problemas para priorizar tareas: Se sienten abrumados por la cantidad de tareas y no saben por dónde empezar. Baja productividad: La indecisión y la procrastinación afectan su rendimiento laboral. Podría presentar dificultades para adaptarse a entornos muy cambiantes: Les cuesta adaptarse a nuevas situaciones y cambios en su entorno laboral. Evitación de responsabilidades: Tienden a evitar asumir responsabilidades y delegar tareas en otros. Insatisfacción laboral en contextos poco estructurados: La falta de determinación y la dificultad para tomar decisiones pueden generar una sensación de insatisfacción en aquellos trabajos donde no existen lineamientos claros. Es importante considerar que esta persona podría llegar a adaptarse perfectamente bien frente a jefes de personalidad fuerte o que sean altamente determinados: esta persona manifestará una actitud condescendiente y disciplinada. Bajo la misma lógica, podrían permanecer por muchos años en organizaciones altamente estructuradas o que se caractericen por rigor disciplinario. En general, suelen ser vistos como personas flexibles, amables y condescendientes.', 1),
	(7, 'estructurado', 'alto', 'Esta persona se caracteriza por sus Rutinas Estrictas: La persona tiende a seguir rutinas diarias muy específicas, desde el momento en que se levanta hasta la hora de acostarse. Cada actividad tiene su lugar y su momento preciso. Entorno Ordenado: Su hogar y espacio personal están impecablemente organizados. Cada objeto tiene su lugar asignado y cualquier desorden causa incomodidad. Planificación Detallada: Antes de realizar cualquier actividad, elabora planes detallados y listas de tareas. Puntualidad Excesiva: Llega temprano a todos los compromisos y se siente incómoda con la impuntualidad. Previsión: Anticipa posibles problemas y toma medidas para evitarlos. En la Vida Laboral se caracteriza: Organización Excepcional: Mantiene su escritorio y archivos perfectamente ordenados. Gestión del Tiempo Eficiente: Utiliza agendas y herramientas de planificación para optimizar su tiempo. Enfoque en los Detalles: Se fija en los pequeños detalles y busca la perfección en todo lo que hace. Adhesión a las Normas: Sigue estrictamente las reglas y procedimientos establecidos. Resistencia al Cambio: Puede tener dificultades para adaptarse a cambios inesperados en su rutina o en los procesos de trabajo. Dentro de sus Fortalezas: Confiabilidad: Cumple con sus responsabilidades de manera consistente y confiable. Eficiencia: Optimiza su tiempo y recursos para lograr los objetivos. Atención al Detalle: Garantiza la calidad de su trabajo. Predictibilidad: Es fácil contar con ella para cumplir con plazos y tareas. Dentro de sus Desafíos: Rigidez: Puede ser vista como inflexible o poco adaptable. Perfeccionismo: La búsqueda de la perfección puede llevar a la procrastinación o al estrés. Dificultad para delegar: Puede tener problemas para confiar en que otros realizarán las tareas de la misma manera que ella. Resistencia al Cambio: Los cambios inesperados pueden causar ansiedad y estrés.', 1),
	(8, 'estructurado', 'medio', 'Una persona que se caracteriza por ser medianamente estructurada y ordenada presenta un equilibrio entre la necesidad de organización y la flexibilidad. No es tan rígida como alguien altamente estructurado, pero tampoco tan espontánea como alguien totalmente desordenado. En la Vida Diaria se caracteriza por: Rutinas Flexibles: Tiene una rutina general que sigue, pero es abierta a cambios y espontaneidad. Por ejemplo, puede tener horarios establecidos para ciertas actividades, pero está dispuesta a modificarlos si surge una situación imprevista. Entorno Organizado, pero no Perfecto: Mantiene su espacio limpio y ordenado, pero tolera cierto grado de desorden. Planificación Básica: Planifica sus actividades, pero no se obsesiona con los detalles. Puntualidad Relativa: Valora la puntualidad, pero entiende que a veces los imprevistos ocurren. Adaptabilidad: Se adapta fácilmente a cambios en sus planes o rutinas. En la Vida Laboral se caracteriza: Organización Básica: Mantiene su escritorio y archivos ordenados, pero no necesita que todo esté perfectamente alineado. Gestión del Tiempo Eficiente: Utiliza herramientas de planificación, pero también confía en su intuición para priorizar tareas. Enfoque en los Resultados: Se centra en lograr los objetivos, pero es flexible en cuanto a los métodos utilizados. Colaboración: Trabaja bien en equipo y se adapta a diferentes estilos de trabajo. Innovación: Está abierta a nuevas ideas y enfoques. Fortalezas que presenta: Equilibrio: Combina la estructura con la flexibilidad. Adaptabilidad: Se ajusta fácilmente a los cambios. Creatividad: Está abierta a nuevas ideas y enfoques. Relaciones Interpersonales: Se relaciona bien con los demás y es un buen compañero de equipo. Desafíos: Dificultad para tomar decisiones importantes: Puede sentirse abrumada por demasiadas opciones. Procrastinación ocasional: Puede posponer tareas si no se siente motivada. Dificultad para cumplir con plazos ajustados: Si la presión es demasiado grande, puede sentirse abrumada. Una persona medianamente estructurada y ordenada ofrece un equilibrio entre la necesidad de organización y la capacidad de adaptarse a situaciones cambiantes. Esta flexibilidad la hace valiosa en una variedad de roles profesionales. Sin embargo, es importante que desarrolle estrategias para mejorar su organización en áreas donde lo necesite, como la gestión del tiempo o la toma de decisiones.', 1),
	(9, 'estructurado', 'bajo', 'Una persona con un bajo nivel de estructuración tiende a ser más espontánea, flexible y abierta a lo inesperado. Su estilo de vida y trabajo se caracterizan por tener en su Vida Diaria mucha Espontaneidad: Prefiere tomar decisiones en el último momento y ajustar sus planes sobre la marcha. Flexibilidad: Se adapta fácilmente a cambios y situaciones imprevistas. Creatividad: Tiene una mente abierta y disfruta explorando nuevas ideas y perspectivas. Desorden: Su entorno físico puede ser más desordenado y caótico. Dificultad para cumplir con horarios: Puede llegar tarde a citas o eventos. En la Vida Laboral se caracteriza por su Pensamiento Lateral: Busca soluciones creativas y fuera de lo común. Trabajo en Equipo: Colabora bien con otros y disfruta de ambientes de trabajo dinámicos. Adaptabilidad: Se ajusta rápidamente a los cambios en los proyectos o en la organización. Dificultad para cumplir con plazos: Puede postergar tareas o no priorizarlas adecuadamente. Necesidad de estímulos constantes: Busca variedad y nuevos desafíos para mantenerse motivado. Dentro de sus Fortalezas: Creatividad: Genera ideas innovadoras. Flexibilidad: Se adapta a cambios y situaciones imprevistas. Habilidades interpersonales: Construye relaciones sólidas. Enfoque en el presente: Disfruta del momento presente. Desafíos u oportunidades de mejora: Dificultad para cumplir con plazos: Puede tener problemas para finalizar proyectos a tiempo. Falta de organización: Puede perder objetos o información importante. Impulsividad: Puede tomar decisiones sin considerar todas las consecuencias. Dificultad para trabajar de forma independiente: Puede necesitar supervisión y estructura para mantenerse enfocado. En Conclusión: Una persona con un bajo nivel de estructuración aporta una perspectiva única y valiosa a cualquier equipo. Su creatividad y flexibilidad son cualidades muy apreciadas en muchos entornos laborales. Sin embargo, es importante que desarrolle estrategias para mejorar su organización y cumplir con los plazos establecidos.', 1),
	(10, 'creativo', 'alto', 'Una persona altamente creativa se caracteriza por una mente inquieta, una visión original y una capacidad innata para conectar ideas de formas únicas. Tanto en su vida diaria como en su ámbito laboral, esta creatividad se manifiesta de diversas maneras. En la Vida Diaria se va a caracterizar por: Curiosidad insaciable: Siempre están buscando nuevas experiencias, conocimientos y estímulos. Pensamiento divergente: Su mente genera múltiples ideas y soluciones a los problemas, a menudo explorando caminos poco convencionales. Imaginación vívida: Tienen una gran capacidad para visualizar y crear mundos imaginarios. Flexibilidad mental: Se adaptan fácilmente a los cambios y disfrutan de la espontaneidad. Interés por el arte y la cultura: A menudo se sienten atraídos por expresiones artísticas como la música, la pintura, la literatura, etc. Conexión con la naturaleza: Encuentran inspiración en la belleza y los procesos naturales. Pasión por los proyectos: Inician nuevos proyectos con entusiasmo y energía. En la Vida Laboral se va a caracterizar por: Innovación constante: Buscan nuevas formas de hacer las cosas y mejorar los procesos existentes. Resolución creativa de problemas: Enfrentan los desafíos como oportunidades para desarrollar soluciones originales. Pensamiento estratégico: Visualizan el panorama general y generan ideas que aportan valor a largo plazo. Colaboración efectiva: Trabajan bien en equipo y fomentan la diversidad de perspectivas. Adaptabilidad: Se sienten cómodos en entornos cambiantes y pueden manejar la incertidumbre. Liderazgo visionario: Inspiran a otros con sus ideas y su entusiasmo. Tolerancia al riesgo: Están dispuestos a experimentar y a salir de su zona de confort. Características Comunes Observación aguda: Notan detalles que otros pasan por alto. Conexión de ideas aparentemente dispares: Establecen relaciones entre conceptos que a primera vista no parecen estar relacionados. Curiosidad por el mundo: Desean comprender cómo funcionan las cosas. Pasión por aprender: Están en constante búsqueda de nuevos conocimientos. Tolerancia a la ambigüedad: Se sienten cómodos con la incertidumbre y la falta de respuestas definitivas. Desafíos Si bien la creatividad es una gran ventaja, también puede presentar algunos desafíos: Dificultad para concentrarse: La mente creativa puede divagar fácilmente, dificultando la concentración en una sola tarea. Impulsividad: La necesidad de explorar nuevas ideas puede llevar a tomar decisiones impulsivas. Perfeccionismo: La búsqueda de la idea perfecta puede generar bloqueos creativos. Dificultad para terminar proyectos: La emoción de empezar un nuevo proyecto puede eclipsar la necesidad de finalizar los anteriores.', 1),
	(11, 'creativo', 'medio', 'Una persona con un nivel medio de creatividad presenta un equilibrio entre la capacidad de pensar de manera original y la habilidad para aplicar soluciones prácticas. Su enfoque es generalmente más pragmático que el de un individuo altamente creativo, pero también muestra una mayor flexibilidad que una persona con una creatividad baja. En la Vida Diaria Innovación moderada: Busca mejoras en las rutinas diarias, pero generalmente dentro de un marco establecido. Por ejemplo, puede experimentar con nuevas recetas, pero se apega a los ingredientes que conoce. Adaptabilidad flexible: Se adapta a los cambios con relativa facilidad, pero prefiere soluciones probadas antes de aventurarse en lo desconocido. Apreciación por el arte y la cultura: Disfruta de diversas expresiones artísticas, pero no necesariamente busca crearlas de manera profesional. Resolución de problemas práctica: En situaciones cotidianas, busca soluciones eficientes y funcionales, pero no siempre explora todas las posibilidades. En la Vida Laboral Generación de ideas: Contribuye con ideas nuevas, pero suele basarse en conocimientos y experiencias previas. Mejora de procesos: Identifica oportunidades para optimizar tareas y procedimientos, pero prefiere soluciones incrementales. Colaboración efectiva: Trabaja bien en equipo y aporta ideas constructivas a las discusiones, pero puede ser más cauteloso al expresar opiniones radicalmente nuevas. Adaptabilidad a los cambios: Se adapta a los cambios organizacionales, pero puede necesitar tiempo para ajustarse a nuevas formas de trabajo. Enfoque en resultados: Valora la eficiencia y la productividad, buscando soluciones que generen resultados tangibles. Características Clave Equilibrio entre lo nuevo y lo conocido: Combina la búsqueda de nuevas ideas con la valoración de lo probado y efectivo. Pragmatismo: Prioriza soluciones prácticas y realistas. Flexibilidad moderada: Se adapta a los cambios, pero puede resistirse a cambios radicales. Habilidades de comunicación: Expresa sus ideas de manera clara y concisa, facilitando la colaboración. Aprendizaje continuo: Busca oportunidades para adquirir nuevos conocimientos y habilidades. Fortalezas Capacidad de ejecución: Convierte ideas en acciones de manera efectiva. Adaptabilidad: Se ajusta a diferentes situaciones y entornos laborales. Habilidades de colaboración: Trabaja bien en equipo y fomenta un ambiente de trabajo positivo. Enfoque en resultados: Prioriza la obtención de resultados tangibles. Desafíos: Miedo a lo desconocido: Puede resistirse a ideas radicalmente nuevas o a cambios significativos. Dificultad para pensar fuera de la caja: A veces puede quedar atrapado en soluciones convencionales. Falta de innovación radical: Puede ser menos propenso a generar ideas disruptivas o revolucionarias. En resumen, una persona con un nivel medio de creatividad es un valioso activo para cualquier organización. Su capacidad para combinar la innovación con el pragmatismo la convierte en un colaborador eficaz y adaptable. Sin embargo, para fomentar un mayor crecimiento y desarrollo, es importante alentarla a explorar nuevas ideas y a salir de su zona de confort.', 1),
	(12, 'creativo', 'bajo', 'Una persona con un nivel bajo de creatividad tiende a seguir patrones establecidos y a preferir soluciones convencionales. Su enfoque es más estructurado y menos propenso a la exploración de nuevas ideas. En la Vida Diaria se caracteriza por:  Rutinas establecidas: Prefiere seguir rutinas y horarios fijos, encontrando comodidad en la repetición. Pensamiento lineal: Resuelve problemas siguiendo pasos lógicos y secuenciales, sin explorar múltiples opciones. Resistencia al cambio: Se siente más cómoda con lo familiar y puede resistirse a cambios en su entorno o hábitos. Intereses convencionales: Sus intereses suelen ser más tradicionales y menos exploratorios. Dificultad para improvisar: En situaciones inesperadas, puede sentirse incómoda y buscar soluciones ya conocidas. En la Vida Laboral se caracteriza por:  Enfoque en tareas: Se concentra en completar tareas específicas y cumplir con los requisitos establecidos. Adherencia a las reglas: Sigue estrictamente las normas y procedimientos establecidos. Dificultad para generar nuevas ideas: Le cuesta pensar en soluciones innovadoras o alternativas. Preferencias por tareas repetitivas: Se siente más cómoda realizando tareas que requieren precisión y atención al detalle. Resistencia al cambio: Puede resistirse a nuevas formas de trabajo o a la implementación de tecnologías innovadoras. Algunas Características Clave de esta persona: Pensamiento convergente: Busca una única solución correcta a un problema. Preferencias por lo conocido: Se siente más segura con lo que ya sabe y ha experimentado. Resistencia a la ambigüedad: Prefiere situaciones claras y definidas. Dificultad para salir de la zona de confort: Evita situaciones que la obliguen a pensar de manera diferente. Algunas Fortalezas: Confiabilidad: Cumple con sus responsabilidades de manera consistente y confiable. Atención al detalle: Realiza tareas con precisión y cuidado. Organización: Mantiene un orden y estructura en su trabajo. Desafíos que tendrá que enfrentar: Dificultad para adaptarse a cambios: Puede tener problemas para ajustarse a nuevas situaciones o requerimientos. Falta de innovación: Puede limitar la capacidad de la organización para encontrar nuevas soluciones y mejorar sus procesos. Resistencia al cambio: Puede obstaculizar la implementación de nuevas ideas o tecnologías. En resumen, una persona con un nivel bajo de creatividad puede ser un valioso miembro de un equipo, especialmente en roles que requieran precisión, atención al detalle y cumplimiento de normas. Sin embargo, su resistencia al cambio y su dificultad para generar nuevas ideas pueden limitar su potencial en entornos que valoran la innovación y la flexibilidad.', 1),
	(13, 'racional', 'alto', 'Una persona altamente racional se caracteriza por basar sus pensamientos y acciones en la lógica, la evidencia y el análisis crítico. Su toma de decisiones suele ser metódica y objetiva, buscando siempre la información más precisa y relevante. En la Vida Diaria se caracteriza por Toma de decisiones lógica: Analiza cuidadosamente las opciones antes de tomar una decisión, sopesando los pros y los contras de cada una. Orientación hacia los hechos: Busca pruebas y datos concretos para respaldar sus creencias y opiniones. Planificación meticulosa: Organiza su tiempo y tareas de manera eficiente, estableciendo objetivos claros y siguiendo un plan detallado. Calma y objetividad: Mantiene la calma en situaciones difíciles y evita dejarse llevar por emociones impulsivas. Escepticismo saludable: Cuestiona las afirmaciones y busca evidencia antes de aceptarlas como verdaderas. En la Vida Laboral se caracteriza por: Análisis de datos: Utiliza datos y métricas para evaluar el desempeño y tomar decisiones informadas. Resolución de problemas sistemática: Aborda los problemas de manera lógica y estructurada, siguiendo un proceso paso a paso. Enfoque en resultados: Se concentra en lograr objetivos específicos y medibles. Comunicación clara y concisa: Expresa sus ideas de manera clara y directa, evitando ambigüedades. Adaptabilidad a los cambios: Puede ajustar sus planes y estrategias en función de nueva información o circunstancias cambiantes. Algunas de sus Fortalezas: Pensamiento crítico: Capacidad para evaluar información de manera objetiva y detectar falacias lógicas. Toma de decisiones efectiva: Toma decisiones informadas y basadas en evidencia. Habilidades analíticas: Descompone problemas complejos en partes más pequeñas y fáciles de manejar. Confiabilidad: Cumple con sus compromisos y es una persona de palabra. Algunos de sus Desafíos: Dificultad para conectar emocionalmente: Puede tener dificultades para comprender o expresar emociones. Rigidez en el pensamiento: Puede ser resistente a nuevas ideas que no se ajusten a su marco lógico. Falta de espontaneidad: Puede parecer poco flexible o poco creativo en situaciones que requieren improvisación. En resumen, una persona altamente racional es un activo valioso en entornos que requieren análisis detallado, toma de decisiones basada en evidencia y resolución de problemas. Sin embargo, es importante reconocer que la racionalidad excesiva puede limitar la capacidad de conectar con las personas a un nivel emocional y de ser flexible en situaciones cambiantes.', 1),
	(14, 'racional', 'medio', 'Una persona que logra equilibrar su racionalidad y emocionalidad es capaz de tomar decisiones informadas y basadas en sus valores, al tiempo que considera las implicaciones emocionales de sus acciones. Este equilibrio le permite navegar por la complejidad de la vida con mayor facilidad y eficacia. En la Vida Diaria se caracteriza por: Toma de decisiones equilibrada: Al tomar decisiones, esta persona considera tanto los aspectos lógicos y racionales como sus sentimientos e intuiciones. Por ejemplo, al elegir una nueva casa, evaluará factores como la ubicación, el precio y las características de la propiedad, pero también considerará cómo se siente en el espacio y si se adapta a su estilo de vida. Empatía y conexión social: Entiende y comparte los sentimientos de los demás, lo que facilita la construcción de relaciones sólidas y significativas. Adaptabilidad: Puede adaptarse a situaciones cambiantes y encontrar soluciones creativas, ya que combina su pensamiento lógico con una mente abierta. Gestión emocional saludable: Reconoce y expresa sus emociones de manera constructiva, sin dejar que estas interfieran en su toma de decisiones. Perspectiva equilibrada: Evita los extremos y busca un punto de vista equilibrado en diferentes situaciones. En la Vida Laboral se caracterizará por Liderazgo efectivo: Inspira a otros a través de una combinación de visión estratégica y empatía. Resolución de conflictos: Aborda los conflictos de manera constructiva, buscando soluciones que satisfagan las necesidades de todas las partes involucradas. Innovación: Combina el pensamiento lógico con la creatividad para generar nuevas ideas y soluciones. Relaciones interpersonales sólidas: Construye relaciones de confianza con colegas y clientes, lo que facilita la colaboración y el éxito en equipo. Adaptabilidad al cambio: Se adapta a los cambios organizacionales con flexibilidad y resiliencia. Dentro de sus Fortalezas destaca por su Inteligencia emocional: Capacidad para reconocer, entender y gestionar sus propias emociones y las de los demás. Pensamiento crítico: Habilidad para analizar información de manera objetiva y llegar a conclusiones lógicas. Flexibilidad: Capacidad para adaptarse a diferentes situaciones y perspectivas. Empatía: Comprensión de los sentimientos y necesidades de los demás. Equilibrio: Capacidad para encontrar un equilibrio entre diferentes necesidades y prioridades. Dentro de sus Desafíos se puede mencionar: Dificultad para tomar decisiones rápidas: Puede dedicar demasiado tiempo a analizar todas las opciones antes de tomar una decisión. Vulnerabilidad a las emociones fuertes: En ocasiones, las emociones pueden nublar el juicio. En resumen, una persona con un buen equilibrio entre racionalidad y emocionalidad es un activo valioso en cualquier entorno. Su capacidad para pensar de manera lógica y al mismo tiempo conectar con las personas a un nivel emocional le permite abordar los desafíos de manera efectiva y construir relaciones sólidas.', 1),
	(15, 'racional', 'bajo', 'Una persona con un estilo eminentemente emocional se caracteriza por dejar que sus sentimientos guíen sus pensamientos y acciones. Sus decisiones suelen estar influenciadas por sus emociones, intuiciones y valores personales. En la Vida Diaria se caracteriza por Conexión emocional profunda: Establece conexiones significativas con las personas y los lugares, valorando las relaciones interpersonales por encima de todo. Empatía aguda: Se pone en el lugar de los demás y comprende sus sentimientos de manera profunda. Intuición desarrollada: Confía en su instinto y corazonadas para tomar decisiones. Expressividad emocional: No tiene problemas para expresar sus sentimientos y opiniones. Creatividad: Tiene una mente abierta y una imaginación vívida, lo que le permite encontrar belleza y significado en las cosas cotidianas. En la Vida Laboral se caracteriza por Liderazgo inspiracional: Motiva a otros a través de su entusiasmo y pasión. Habilidades de comunicación: Se comunica de manera clara y concisa, conectando con las personas a un nivel emocional. Trabajo en equipo: Valora la colaboración y la construcción de relaciones sólidas con sus colegas. Innovación: Aporta ideas creativas y originales a los proyectos. Adaptabilidad: Se adapta fácilmente a los cambios y es capaz de encontrar soluciones creativas a los problemas. Dentro de sus Fortalezas destaca por Empatía: Capacidad para comprender y compartir los sentimientos de los demás. Creatividad: Pensamiento original y capacidad para generar nuevas ideas. Conexión emocional: Establece relaciones significativas con los demás. Pasión: Entusiasmo y dedicación a sus intereses y objetivos. Dentro de sus Desafíos presenta Dificultad para tomar decisiones objetivas: Puede dejar que las emociones interfieran en su juicio. Vulnerabilidad: Puede sentirse herida fácilmente por las críticas o los comentarios negativos. Dificultad para manejar el estrés: Las emociones intensas pueden dificultar la gestión del estrés. En resumen, una persona eminentemente emocional aporta una riqueza de emociones y una perspectiva única a cualquier situación. Sin embargo, es importante que aprenda a equilibrar sus emociones con la lógica y la razón para tomar decisiones más objetivas y evitar que sus sentimientos la controlen.', 1),
	(16, 'extrovertido', 'alto', '2.- Lorem Ipsum', 0),
	(17, 'extrovertido', 'alto', '3.- aaaaaaaaaaaaaaaaa', 0),
	(18, 'extrovertido', 'alto', '2.- Nuevo texto recien agregado :D', 0),
	(19, 'extrovertido', 'medio', '2.- Texto medio', 0),
	(20, 'extrovertido', 'bajo', '2.- Texto bajooo', 0),
	(21, 'extrovertido', 'alto', '3.- text alto', 0),
	(22, 'extrovertido', 'medio', '3.- textooo', 0),
	(23, 'extrovertido', 'bajo', '3.- texttttttoooo', 0);

-- Volcando estructura para tabla jobfitter.emotions
CREATE TABLE IF NOT EXISTS `emotions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emotion_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla jobfitter.emotions: ~8 rows (aproximadamente)
INSERT INTO `emotions` (`id`, `emotion_name`) VALUES
	(1, 'HAPPY'),
	(2, 'CONFUSED'),
	(3, 'ANGRY'),
	(4, 'CALM'),
	(5, 'SURPRISED'),
	(6, 'SAD'),
	(7, 'FEAR'),
	(8, 'DISGUSTED');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;