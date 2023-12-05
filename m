Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBBB805192
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Dec 2023 12:08:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rATHZ-00072J-U6;
	Tue, 05 Dec 2023 11:08:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <notificaciones.cancilleria@mppre.gob.ve>)
 id 1rATHX-000727-L7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 11:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Message-Id:Sender:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3C1CUPtsmp8aRKgdTHqt6khrC21+7NDWlNcQLeDhcag=; b=RQ8Qz2Y5beguhkMN4x0KAi6LPA
 +VB7g6ipscNcyShvOZuQNTOSN5uVX5x4b/li1mRBxTBuaMTrmytuI91yZRF3kGiYq1AYRH3nIthpX
 QI5iprUPXG6umJML9XjT1QdVbYBiWWK/+y8QG4w3L9GZR5WQVIYXUmTKxjSqBQakaCIs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Message-Id:Sender:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3C1CUPtsmp8aRKgdTHqt6khrC21+7NDWlNcQLeDhcag=; b=WvfSmuw1c5mX4S2IzAAltGMd0x
 2Djbe9/7iE+Ac7081uylzAvCFAo/+y1DW5TYL4N2FwNyaS3iU+okDzzaV926Npw8+xQ33VAHkooJj
 FDTb72IW2uw4xLFNbjTuWHJJtams2omJPwZZrf9tMwMOCNHDPacS5FYTlaukGCuo/MCg=;
Received: from mail.mppre.gob.ve ([64.212.76.3] helo=mx1.mppre.gob.ve)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rATHW-0003Ld-Kv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 11:08:03 +0000
Message-Id: <202312051110.3B55Lgn5013824-3B5ArrDX013824@fml.mppre.gob.ve>
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 05 Dec 2023 03:07:38 -0800
X-FEAS-DLP: .
X-FE-Policy-ID: 11:0:6:mppre.gob.ve
X-Spam-Score: 6.3 (++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello How are you, I hope this email finds you in good health
 and spirit? Before I continue let me humbly apologize for coming into your
 space unsolicited. Nonetheless, I take solace in the fact that it is [...]
 Content analysis details:   (6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [64.212.76.3 listed in zen.spamhaus.org]
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
 digit [mydealing54[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_FAIL          SPF: HELO does not match SPF record (fail)
 [SPF failed: Rejected by SPF record]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 0.0 ADVANCE_FEE_4_NEW      Appears to be advance fee fraud (Nigerian 419)
X-Headers-End: 1rATHW-0003Ld-Kv
Subject: [f2fs-dev] GREAT
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Anna Pechorin via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: mydealing54@gmail.com
Cc: Anna Pechorin <notificaciones.cancilleria@mppre.gob.ve>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello

How are you, I hope this email finds you in good health and spirit? Before =
I continue let me humbly apologize for coming into your space unsolicited. =
Nonetheless, I take solace in the fact that it is with the best intention a=
nd for our mutual benefit.

I chose you among other contacts I came across in my search for someone who=
 can be of help.  It took a great deal of brain storming to arrive at my de=
cision I must say, with the hope that my contact with you will be private a=
nd confidential.

The business idea that I have is to partner with you by investing in your c=
ountry and you becoming my fund manager. This whole idea is borne out of th=
e fact that presently I am totally indisposed to carry out any financial tr=
ansaction owing to restrictions relating to the Russia /Ukraine war and the=
 suspicious death of my husband, Ivan Pechorin in the hand of our President=
 Vladimir Putin.

It will be an absolute pleasure, if you would have the wherewithal to handl=
e this project to my satisfaction. Every detail concerning this project wou=
ld be laid bare to you upon indication of your interest.

Please strictly respond to mydealing54@gmail.com


Best regards

Anna Pechorin.

___________________________________________________________________________=
__________________________________________________________________
DERECHOS DE USO
La informaci=F3n en sus distintas modalidades,=A0 transmitidas en este corr=
eo=A0 es confidencial, propiedad =FAnica y exclusiva del Ministerio del Pod=
er Popular para Relaciones Exteriores con car=E1cter privado; y est=E1 diri=
gido exclusivamente a su(s) destinatario(s), el mismo, no podr=E1 ser objet=
o de reproducci=F3n total o parcial, ni transmitida, reproducida o copiada =
bajo ninguna circunstancia, forma o por cualquier otro=A0 medio, electr=F3n=
ico, mec=E1nico, digital, registro o cualquier otro.=A0 El mismo no podr=E1=
 ser distribuido hacia otras plataformas de correo sin el permiso previo y =
escrito de la Coordinaci=F3n de Seguridad Inform=E1tica, bajo ning=FAn conc=
epto. Si usted ha recibido este mensaje por error, debe evitar realizar cua=
lquier acci=F3n descrita anteriormente, asimismo le agradecemos comunicarlo=
 al remitente y borrar el mensaje y cualquier documento adjunto. El incumpl=
imiento de las limitaciones se=F1aladas por cualquier persona que tenga acc=
eso a la documentaci=F3n ser=E1 sancionada conforme a la ley.




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
