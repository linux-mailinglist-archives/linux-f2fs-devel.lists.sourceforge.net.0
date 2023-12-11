Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60480C35F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Dec 2023 09:36:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCbmK-0003JC-Qt;
	Mon, 11 Dec 2023 08:36:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lukas.varga@venturelinkage.com>) id 1rCbmK-0003Iw-4O
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Dec 2023 08:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7iowqdzve/IIiUUjcEwx8j3uMrVqqiE7R9zbOCKRV9Q=; b=TTIGyfsxbHAhLuEBDQAfnib/Hd
 8gQ22FCQWQN/RYuxQTzh62ROHxZNgxTIv0hPsUejp8dXyPRdmV3kqUzcCTl+dUL2rsxs04VKklxeL
 VJtYPRjOOcFF+J6C6xssrcdPk+ruRldOub2SmPl1pLHaSBpRFnTYC6Bx1ta9SZNGnNpk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7iowqdzve/IIiUUjcEwx8j3uMrVqqiE7R9zbOCKRV9Q=; b=U
 4+EDI0oOn48tN6M/UUtDm1nWZslr3AU5Olri++OlmVO19cItdy2o0TG/SRf8itfiKwOKLnpEnaoJY
 hSK2NOZ5Blt2dVozK1QNMCzRpPU0htPg581bYTTIFi2jCUpNtmC4ieKdeYo5TgU7fGUKiQtTWt5Sh
 NwjnIGHuXMRYA6xM=;
Received: from mail.venturelinkage.com ([80.211.143.151])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCbmJ-0005g1-Pj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Dec 2023 08:36:40 +0000
Received: by mail.venturelinkage.com (Postfix, from userid 1002)
 id 6D2AB82515; Mon, 11 Dec 2023 09:36:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturelinkage.com;
 s=mail; t=1702283793;
 bh=7iowqdzve/IIiUUjcEwx8j3uMrVqqiE7R9zbOCKRV9Q=;
 h=Date:From:To:Subject:From;
 b=ptkMws+ssINxsJiWL0Cjjep0iPWbRcIOUA1/SRtwfBRpVierOzatS4/P/aWqhm2+M
 iSxVv3VT2m5MY11HCgAGJmQq/eYleNkgfi5QvHCxrdoioCQSB3WdOHFWaddoIlrlL/
 cfNNhSLZ9P2O2Evcv4qnkyccMm82+mScmpmaT95OwUGrDRRB82SIDxlXeoD3t7rEhN
 GrY7aD3YnJ44IBzBgj1wblxPAX9U0agRRMOvLpD0pp1cMIDFvBrEEmFozuNF6jAV4J
 FQlPl9HPBbPgj/3isvscTf81zmpm1hQIJQI9PdOUAQqmK1Jj2HoHKKQTd6M/CoPQnJ
 TCg0AeR8lQ0TA==
Received: by mail.venturelinkage.com for
 <linux-f2fs-devel@lists.sourceforge.net>; Mon, 11 Dec 2023 08:36:27 GMT
Message-ID: <20231211084500-0.1.25.5dr4.0.90k8evhd3s@venturelinkage.com>
Date: Mon, 11 Dec 2023 08:36:27 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.venturelinkage.com
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dobré ráno, Dovolil jsem si Vás kontaktovat, protože mám
    zájem ověřit možnost navázání spolupráce. Podporujeme firmy při
   získávání nových obchodních zákazníků. 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rCbmJ-0005g1-Pj
Subject: [f2fs-dev] =?utf-8?b?UG9wdMOhdmth?=
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
From: Lukas Varga via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Lukas Varga <lukas.varga@venturelinkage.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RG9icsOpIHLDoW5vLAoKRG92b2xpbCBqc2VtIHNpIFbDoXMga29udGFrdG92YXQsIHByb3Rvxb5l
IG3DoW0gesOhamVtIG92xJvFmWl0IG1vxb5ub3N0IG5hdsOhesOhbsOtIHNwb2x1cHLDoWNlLgoK
UG9kcG9ydWplbWUgZmlybXkgcMWZaSB6w61za8OhdsOhbsOtIG5vdsO9Y2ggb2JjaG9kbsOtY2gg
esOha2F6bsOta8WvLgoKTcWvxb5lbWUgc2kgcHJvbWx1dml0IGEgcG9za3l0bm91dCBwb2Ryb2Ju
b3N0aT8KClYgcMWZw61wYWTEmyB6w6FqbXUgVsOhcyBidWRlIGtvbnRha3RvdmF0IG7DocWhIGFu
Z2xpY2t5IG1sdXbDrWPDrSB6w6FzdHVwY2UuCgoKUG96ZHJhdnkKTHVrYXMgVmFyZ2EKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
