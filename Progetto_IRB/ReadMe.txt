Contenuto della directory Progetto_IRB :
 |   
 |
 |
 |------- directory -> Simulazione_IRB_1300_matlab: Questa directory contiene due directory indipendenti relative al modello cinematico e al modello dinamico.
 |         |
 |	   |----- sub_directory-> Contr_Cinematico_Task_Aggancio_e_Sgancio_Utensile: 
 |         |      (PER AVVIARE LA SIMULAZIONE ESEGUIRE LO SCRIPT : IRB1300_ABB6DOF_bodytree_mesh_RUN1.m E SUCCESSIVAMENTE ESEGUIRE IL MODELLO Modello_Irb1300.slx)
 |         |      
 |         |		- sub_directory-> mesh_IRB1300: Questa directory contiene le mesh (.stl) del modello utilizzate dallo script: IRB1300_ABB6DOF_bodytree_mesh_RUN1.m.
 |	   |		- sub_directory-> worlds: Questa directory contiene tutte le componenti grafiche utilizzate dallo script: robot_scene_2.x3d.
 |         |                     	sub_directory-> oggetti_nella_scena: Questa directory contiene i file: Elettromandrino_3d_semplificato.wrl, Spina_hsk_f63.wrl.
 |         |                     	sub_directory-> texture: Questa directory contiene il file: gravel.jpg utilizzato per lo sfondo della scena.
 |         |
 |	   |		file -> DHmatrix.m : Questo script è utilizzato durante l'esecuzione dello script: MatriceDH_Robot_irb1300.m                      
 | 	   |		file -> MatriceDH_Robot_irb1300.m : Questo script necessità dello script DHmatrix.m e fornisce come risultato i file: H_Matrix_ABBirb1300.mat e J_Jp_Jo_irb1300.mat	
 |	   |		file -> H_Matrix_ABBirb1300.mat : Questo file viene prodotto dallo script: MatriceDH_Robot_irb1300.m
 |	   |		file -> J_Jp_Jo_irb1300.mat : Questo file viene prodotto dallo script: MatriceDH_Robot_irb1300.m
 |         |            file -> Robot_irb1300_Pinza_Hsk.urdf : Questo file contiene i parametri inerziali del robot utilizzati nei file:IRB1300_ABB6DOF_bodytree_mesh_RUN1.m
 |         |		file -> IRB1300_ABB6DOF_bodytree_mesh_RUN1.m : Questo file genera il modello grafico della simulazione e necessita dei file contenuti nella directory: mesh_IRB1300
 |         |            file -> robot_scene_2.x3d : Questo file contiene la scena utilizzata dal modello simulinke e necessita dei file contenuti nella directory: oggetti_nella_scena
 |         |	        file -> Modello_Irb1300.slx : Questo file è il modello del controllo cinematico e prima di eseguirlo è necessario eseguire lo script:IRB1300_ABB6DOF_bodytree_mesh_RUN1.m
 |         |
 |         |    >-------------------------------------------------------------------------------------------------------------------------------------------------------------------<
 |         |
 |	   |----- sub_directory-> Controllo_Dinamico_con_Compensazione_di_Gravità:
 |               (PER AVVIARE LA SIMULAZIONE ESEGUIRE GLI SCRIPT IRB1300_ABB6DOF_bodytree_mesh_RUN1.m eIRB1300_ABB6DOF_parametri_RUN2.m E SUCCESSIVAMENTE ESEGUIRE IL MODELLO: 
 |                 Modello_Irb1300_controllo_dinamico.slx )
 |			 
 |                      - sub_directory-> mesh_IRB1300: Questa directory contiene le mesh (.stl) del modello utilizzate dallo script: IRB1300_ABB6DOF_bodytree_mesh_RUN1.m.
 |			- sub_directory-> worlds: Questa directory contiene tutte le componenti grafiche utilizzate dallo script: robot_scene_2.x3d.
 |                               	sub_directory-> oggetti_nella_scena: Questa directory contiene i file: Elettromandrino_3d_semplificato.wrl, Spina_hsk_f63.wrl.
 |                               	sub_directory-> texture: Questa directory contiene il file: gravel.jpg utilizzato per lo sfondo della scena.
 | 
 |			file -> DHmatrix.m : Questo script è utilizzato durante l'esecuzione dello script: MatriceDH_Robot_irb1300.m                       
 | 			file -> MatriceDH_Robot_irb1300.m : Questo script necessità dello script DHmatrix.m e fornisce come risultato i file: H_Matrix_ABBirb1300.mat e J_Jp_Jo_irb1300.mat	
 |			file -> H_Matrix_ABBirb1300.mat : Questo file viene prodotto dallo script: MatriceDH_Robot_irb1300.m
 |			file -> J_Jp_Jo_irb1300.mat : Questo file viene prodotto dallo script: MatriceDH_Robot_irb1300.m
 |			file -> JacobianDerive_wrt_time.m : Questo script viene utilizzato per calcolare la derivata del Jacobiano simbolico utilizzato nel blocco simulink: DJA 
 | 			file -> numeric_T.m : Questo script viene utilizzato nello script RNE_Calc.m
 |                      file -> Robot_irb1300_Pinza_Hsk.urdf : Questo file contiene i parametri inerziali del robot utilizzati nei file:IRB1300_ABB6DOF_bodytree_mesh_RUN1.m, IRB1300_ABB6DOF_parametri_RUN2.m
 |                      file -> RNE_Calc.m : Questo script implementa l'algoritmo ricorsivo di Newton Eulero e viene utilizzato dal blocco simulink: RNE
 | 			file -> IRB1300_ABB6DOF_bodytree_mesh_RUN1.m : Questo file genera il modello grafico della simulazione e necessita dei file contenuti nella directory: mesh_IRB1300
 |			file -> IRB1300_ABB6DOF_parametri_RUN2.m: Questo file permette di inviare al modello simulink i parametri inerziali del robot necessita del file: H_Matrix_ABBirb1300.mat
 |			file -> robot_scene_2.x3d : Questo file contiene la scena utilizzata dal modello simulink e necessita dei file contenuti nella directory: oggetti_nella_scena
 |       	        file -> Modello_Irb1300_controllo_dinamico.slx : Questo file è il modello simulink del controllo dinamico e prima di eseguirlo è necessario eseguire gli script: 
 |                               IRB1300_ABB6DOF_bodytree_mesh_RUN1.m e IRB1300_ABB6DOF_parametri_RUN2.m
 | 
 |
 |          >---------------------------------------------------------------------------------------------------------------------------------------------------------------------------<
 | 
 |
 | 
 |------- directory -> Robot_IRB1300: Questa directory contiene la documentazione e i file a supporto del progetto che riguardano la parte di modellazione e creazione del file URDF.

        	sub_directory-> ABB_Documentation_Drawings: Questa directory contiene i disegni CAD e la documentazione Robot fornita da ABB.

        	sub_directory-> IRB1300_Pinza_Hsk_URDF_MESH: 
 			      sub_directory-> Dati_inerziali: Questa directory contiene gli screenshoot del configuratore dei parametri di giunto e dei Link.      	
			      sub_directory-> Disegni_CAD. 
			      sub_directory-> Robot_irb1300_Pinza_Hsk_URDF_Files.
                                	    sub_directory-> meshes: Questa directory contiene i file ".stl" utilizzati generati a partire dai disegni CAD. 
                                	    sub_directory-> URDF  : Questa directory contiene il file URDF con la parametrizzazione del Robot IRB1300.    

  	

