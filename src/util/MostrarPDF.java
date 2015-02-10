package util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfWriter;

import entidad.Les;
 
/**
 *
 * 
 */
public class MostrarPDF {
	public String createPdf(Les objLes,String nombre,String narchivo){
		//Ruta del archivo, esto es dentro del proyecto Netbeans
		  String archivo= "D:/Documentos/ECLIPSE/ProyectoLPII_ap/Unknow/WebContent/doc/"+narchivo+".pdf";
	    /*Declaramos documento como un objeto Document
	     *Asignamos el tamaño de hoja y los margenes 
	    */    
	    Document documento = new Document(PageSize.LETTER, 80, 80, 75, 75);
	 
	    //writer es declarado como el método utilizado para escribir en el archivo
	    PdfWriter writer = null;
	 
	    try {      
	      //Obtenemos la instancia del archivo a utilizar
	      try {
			writer = PdfWriter.getInstance(documento, new FileOutputStream(archivo));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    } catch (DocumentException ex) {
	      ex.getMessage();
	    }
	 
	    //Agregamos un titulo al archivo
	    documento.addTitle("Licencia por Enfermedad Subsidiada");
	 
	    //Agregamos el autor del archivo
	    documento.addAuthor("@abc");
	 
	    //Abrimos el documento para edición
	    documento.open();
	 
	    
	 
	    //Declaramos un texto como Paragraph
	    //Le podemos dar formado como alineación, tamaño y color a la fuente.
	    Paragraph parrafoTitulo = new Paragraph();
	    parrafoTitulo.setAlignment(Paragraph.ALIGN_LEFT);
	    parrafoTitulo.setFont(FontFactory.getFont("Sans",19,Font.BOLD));
	    parrafoTitulo.add("INSTITUTO NACIONAL DE REHABILITACIÓN - ");
	    parrafoTitulo.add("DRA. ADRIANA REBAZA FLORES ");
	    
	    
	    Paragraph parrafo0 = new Paragraph();
	    parrafo0.setAlignment(Paragraph.ALIGN_JUSTIFIED);
	    parrafo0.setFont(FontFactory.getFont("Sans",12));
	    parrafo0.add("PARA        :   DIRECTOR GENERAL\n");
	    parrafo0.add("DE             :  "+ nombre +"\n");
	    parrafo0.add("ASUNTO   :   SOLICITUD DE LICENCIA POR ENFERMEDAD SUBSIDIADA\n");
	    parrafo0.add("FECHA      :   "+ objLes.getFechaHora()+"\n");	    
	    
	    
	    
	    
	    Paragraph parrafo1 = new Paragraph();
	    parrafo1.setAlignment(Paragraph.ALIGN_JUSTIFIED);
	    parrafo1.setFont(FontFactory.getFont("Sans",14));
	    parrafo1.add("El asalariado en cumplimiento con las normas legales establecida por el Congreso de la República del Perú, la Ley"+
					"29344 – El Marco de Aseguramiento Universal en Salud, la Ley 29761 – Ley de Financiamiento Público de los Regímenes"+
					"Subsidiado y Semicontributivo del Aseguramiento Universal en Salud, el Decreto Legislativo 276 aprobado con el decreto supremo 005-90-PCM.");
	   
	    Paragraph parrafo2 = new Paragraph();
	    parrafo2.setAlignment(Paragraph.ALIGN_JUSTIFIED);
	    parrafo2.setFont(FontFactory.getFont("Sans",14));
	    parrafo2.add("Por motivo de "+objLes.getMotivoLicencia()+" por "+ objLes.getCantidad()+" dias de descanso medico, "+
					 "que rige a partir del "+objLes.getFechaInicioDes()+" hasta el "+objLes.getFechaFinDes()+" ,se solicita al director de personal por medio de "+
					 "la presente la regularización de las inasistencias por parte del asalariado en mención por motivos , declaro encontrarme "+
					 "dentro de las normas legales, de lo contrario la solicitud tendrá invalidez inmediata.");
	   
	    Paragraph parrafo3 = new Paragraph();
	    parrafo3.setAlignment(Paragraph.ALIGN_RIGHT);
	    parrafo3.setFont(FontFactory.getFont("Sans",14));
	    parrafo3.add("Lima, Chorrillos");
	    
	    try {
	      //Agregamos el texto al documento
	    
	      documento.add(parrafoTitulo);
	      documento.add(new Paragraph(" "));
	      documento.add(parrafo0);
	      documento.add(new Paragraph(" "));
	      documento.add(new Paragraph(" "));
	      documento.add(parrafo1);
	      documento.add(new Paragraph(" "));
	      documento.add(parrafo2);
	      documento.add(new Paragraph(" "));
	      documento.add(new Paragraph(" "));
	      documento.add(new Paragraph(" "));
	      documento.add(new Paragraph(" "));
	      documento.add(parrafo3);
	    } catch (DocumentException ex) {
	      ex.getMessage();
	    }
	    
	    
	    
 writer.setPageEvent(new com.itextpdf.text.pdf.PdfPageEvent() {
			
			@Override
			public void onStartPage(PdfWriter arg0, Document arg1) {
				//ColumnText.showTextAligned(arg0.getDirectContent(), Element.ALIGN_CENTER, new Phrase("Inicio de Pagina - Instituto de Rehabilitacion Nacional"), 200,830,0);
			}
			
			@Override
			public void onSectionEnd(PdfWriter arg0, Document arg1, float arg2) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void onSection(PdfWriter arg0, Document arg1, float arg2, int arg3,
					Paragraph arg4) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void onParagraphEnd(PdfWriter arg0, Document arg1, float arg2) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void onParagraph(PdfWriter arg0, Document arg1, float arg2) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void onOpenDocument(PdfWriter arg0, Document arg1) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void onGenericTag(PdfWriter arg0, Document arg1,
					com.itextpdf.text.Rectangle arg2, String arg3) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void onEndPage(PdfWriter arg0, Document arg1) {
				 ColumnText.showTextAligned(arg0.getDirectContent(), Element.ALIGN_MIDDLE, new Phrase("Teléfono: (01) 717 – 3200 -- Correo: dg@inr.gob.pe"), 180,10,0);
							
				
			}
			
			@Override
			public void onCloseDocument(PdfWriter arg0, Document arg1) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void onChapterEnd(PdfWriter arg0, Document arg1, float arg2) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void onChapter(PdfWriter arg0, Document arg1, float arg2,
					Paragraph arg3) {
				// TODO Auto-generated method stub
				
			}
		});
 		documento.close(); //Cerramos el documento
 		writer.close(); //Cerramos writer
	   
 		narchivo="doc/"+narchivo+".pdf";
	    
	      return narchivo;  
	    
	  }
	
 
 
}