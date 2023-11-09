Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2487E6DA3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Nov 2023 16:41:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r179M-0008GL-Jj;
	Thu, 09 Nov 2023 15:40:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang1@xiaomi.com>) id 1r179L-0008GF-92
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Nov 2023 15:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vz+QrjEVGpoqysK50nUhiYo3hPXzOm7wrDvvvCs5JRg=; b=cTtvJC0bwDsNlzxmATV9GTsev5
 4gCmEp/ne9vSf1N9o03T43yuUly8oVSAiCYcksznUWsb/lLFFD3oFAapRCft5JqpE78awgZCioCcc
 PfcqCyOqhSPqz/q+/fVI8mVenB7Fsb1eCYhBN55XqRm2CFLhH05wfhPaSLWgac219ZmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vz+QrjEVGpoqysK50nUhiYo3hPXzOm7wrDvvvCs5JRg=; b=SEQVCosOUG35qr8DqIfZq0PN90
 EOH9xFLFxGuOF8VZH1ahUMssmY+8paiPXLuTx0otyk5SRX9J+kYC9NxoCYz78EyI3JngiW8R0slsr
 F0FfH/NBNtqxheHq/hfc0gkqCjd39wywYxeHRnB0OT6QPR2uGQQNCWpRosQVD78F/+tE=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1r179J-0006Sv-IY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Nov 2023 15:40:55 +0000
X-IronPort-AV: E=Sophos;i="6.03,289,1694707200"; d="scan'208";a="70304687"
To: <jaegeuk@kernel.org>
Date: Thu, 9 Nov 2023 23:40:18 +0800
Message-ID: <20231109154018.271615-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231109130004.261931-1-zangyangyang1@xiaomi.com>
References: <20231109130004.261931-1-zangyangyang1@xiaomi.com>
MIME-Version: 1.0
X-Originating-IP: [10.237.8.21]
X-ClientProxiedBy: BJ-MBX02.mioffice.cn (10.237.8.122) To BJ-MBX12.mioffice.cn
 (10.237.8.132)
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  I'm very sorry for replying to the wrong email. Please ignore
    this email and the previous patch email. Thanks, zangyangyang #/******±¾ÓÊ¼þ¼°Æä¸½¼þº¬ÓÐÐ¡Ã×¹«Ë¾µÄ±£ÃÜÐÅÏ¢£¬½öÏÞÓÚ·¢ËÍ¸øÉÏÃæµØÖ·ÖÐÁÐ³öµÄ¸öÈË»òÈº×é¡£½ûÖ¹ÈÎºÎÆäËûÈËÒÔÈÎºÎÐÎÊ½Ê¹ÓÃ£¨°üÀ¨µ«²»ÏÞÓÚÈ«²¿»ò²¿·ÖµØÐ¹Â¶¡¢¸´ÖÆ¡¢»òÉ¢·¢£©±¾ÓÊ¼þÖÐµÄÐÅÏ¢¡£Èç¹ûÄú´íÊÕÁ
    [...] 
 
 Content analysis details:   (0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
                             [118.143.206.90 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1r179J-0006Sv-IY
Subject: Re: [f2fs-dev] [PATCH V2] libf2fs: Fix using uninitialized
 variables error in get_device_info()
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
From: zangyangyang1 via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zangyangyang1 <zangyangyang1@xiaomi.com>
Cc: zangyangyang1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: multipart/mixed; boundary="===============1454108654847773130=="
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

--===============1454108654847773130==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

I'm very sorry for replying to the wrong email.
Please ignore this email and the previous patch email.
Thanks,

zangyangyang
#/******=B1=BE=D3=CA=BC=FE=BC=B0=C6=E4=B8=BD=BC=FE=BA=AC=D3=D0=D0=A1=C3=D7=
=B9=AB=CB=BE=B5=C4=B1=A3=C3=DC=D0=C5=CF=A2=A3=AC=BD=F6=CF=DE=D3=DA=B7=A2=CB=
=CD=B8=F8=C9=CF=C3=E6=B5=D8=D6=B7=D6=D0=C1=D0=B3=F6=B5=C4=B8=F6=C8=CB=BB=F2=
=C8=BA=D7=E9=A1=A3=BD=FB=D6=B9=C8=CE=BA=CE=C6=E4=CB=FB=C8=CB=D2=D4=C8=CE=BA=
=CE=D0=CE=CA=BD=CA=B9=D3=C3=A3=A8=B0=FC=C0=A8=B5=AB=B2=BB=CF=DE=D3=DA=C8=AB=
=B2=BF=BB=F2=B2=BF=B7=D6=B5=D8=D0=B9=C2=B6=A1=A2=B8=B4=D6=C6=A1=A2=BB=F2=C9=
=A2=B7=A2=A3=A9=B1=BE=D3=CA=BC=FE=D6=D0=B5=C4=D0=C5=CF=A2=A1=A3=C8=E7=B9=FB=
=C4=FA=B4=ED=CA=D5=C1=CB=B1=BE=D3=CA=BC=FE=A3=AC=C7=EB=C4=FA=C1=A2=BC=B4=B5=
=E7=BB=B0=BB=F2=D3=CA=BC=FE=CD=A8=D6=AA=B7=A2=BC=FE=C8=CB=B2=A2=C9=BE=B3=FD=
=B1=BE=D3=CA=BC=FE=A3=A1 This e-mail and its attachments contain confidenti=
al information from XIAOMI, which is intended only for the person or entity=
 whose address is listed above. Any use of the information contained herein=
 in any way (including, but not limited to, total or partial disclosure, re=
production, or dissemination) by persons other than the intended recipient(=
s) is prohibited. If you receive this e-mail in error, please notify the se=
nder by phone or email immediately and delete it!******/#


--===============1454108654847773130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1454108654847773130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--===============1454108654847773130==--
