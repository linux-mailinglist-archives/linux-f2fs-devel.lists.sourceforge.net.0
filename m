Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE5EA7459B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Mar 2025 09:41:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ty5Gl-0008BP-KL;
	Fri, 28 Mar 2025 08:40:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <information@fhqvy.cn>) id 1ty5Gi-0008BI-V4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 08:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Subject:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CO5fHdArlli+xtR/VgajnZuH3v+PjWQuchDd3YsTJwA=; b=h6LgqpIkt/PBLrTUmYXKYB4kF4
 fz5JhOEbGaKEIUsHKZPkqLj39WCPc61cdLtS7hElWcmWOJXpYmJtQpvKMlOlfyNzzh7zhdDWQPKxT
 wEhUoDXv9o05lG6qujfof7A3x9vdv9ygp7pH2huW2jQcWFcWaHb41lhGNJpD1EhuQHpY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:To:From:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CO5fHdArlli+xtR/VgajnZuH3v+PjWQuchDd3YsTJwA=; b=i
 TZo9uckBeVuPi6UmHCseQdN/SJTfYDsJF9bTewgdbNe9uefhQjdOji2F8fX4zWmGEjVvnKERk6ohp
 CLykOsZh5ZP6X7uPdgVHkVTiZynHeQyt3+11P/J7fST3KKkSAV9be2yPMtFVxKjgA/9JFM3oRl7ge
 hVjbyrzROK4L7TDE=;
Received: from [205.198.89.11] (helo=fhqvy.cn)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ty5GW-0001tT-Qr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 08:40:48 +0000
Message-ID: <000301db9ffd$adfcb842$0034806f@fhqvy.cn>
From: =?utf-8?Q?Paidy?= <information@fhqvy.cn>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Fri, 28 Mar 2025 16:19:39 +0800
MIME-Version: 1.0
X-MSMail-Priority: Low
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-Helo-Check: bad, Forged Random Domain (fhqvy.cn)
X-Spam-Score: 6.7 (++++++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  linux-f2fs-devel 様 いつもペイディをご愛顧いただき、深く感謝申し上げます。
    ペイディでは、特別なお客様へ日頃のご利用に感謝し、5,000ポイント（5,000円相当）を贈
    [...] 
 
 Content analysis details:   (6.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  2.5 URIBL_DBL_SPAM         Contains a spam URL listed in the Spamhaus DBL
                             blocklist
                             [URIs: iertury.com]
  1.9 URIBL_ABUSE_SURBL      Contains an URL listed in the ABUSE SURBL
                             blocklist
                             [URIs: iertury.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [205.198.89.11 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [205.198.89.11 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
  1.0 RATWARE_OUTLOOK_NONAME Bulk email fingerprint (Outlook no name)
                             found
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
  0.0 MIMEOLE_DIRECT_TO_MX   MIMEOLE + direct-to-MX
X-Headers-End: 1ty5GW-0001tT-Qr
Subject: [f2fs-dev] =?utf-8?b?44CQ54m55Yil44GU5YSq5b6F44Gu44GU5qGI5YaF44CR?=
	=?utf-8?b?5pel6aCD44Gu5oSf6Kyd44KS6L6844KB44GmNSwwMDDjg53jgqTjg7M=?=
	=?utf-8?b?44OI44KS6LSI5ZGI?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

bGludXgtZjJmcy1kZXZlbCDmp5ggIA0KDQrjgYTjgaTjgoLjg5rjgqTjg4fjgqPjgpLjgZTmhJvp
oafjgYTjgZ/jgaDjgY3jgIHmt7HjgY/mhJ/orJ3nlLPjgZfkuIrjgZLjgb7jgZnjgIIgIA0K44Oa
44Kk44OH44Kj44Gn44Gv44CB54m55Yil44Gq44GK5a6i5qeY44G45pel6aCD44Gu44GU5Yip55So
44Gr5oSf6Kyd44GX44CBNSwwMDDjg53jgqTjg7Pjg4jvvIg1LDAwMOWGhuebuOW9k++8ieOCkui0
iOWRiOOBhOOBn+OBl+OBvuOBmeOAgg0KDQrpgLLlkYjjgZnjgovjg53jgqTjg7Pjg4jjga/lhajl
m73jga7lupfoiJfjgYrjgojjgbPlhazlvI/jgqrjg7Pjg6njgqTjg7Pjgrfjg6fjg4Pjg5fjgacx
44Od44Kk44Oz44OI77ydMeWGhuOBqOOBl+OBpuOBlOWIqeeUqOOBhOOBn+OBoOOBkeOBvuOBmeOA
guS4i+iomOODquODs+OCr+OCiOOCiuewoeWNmOOBq+OBiuaJi+e2muOBjeOBhOOBn+OBoOOBkeOB
vuOBmeOAgg0KDQrilrwg44Od44Kk44Oz44OI44KS5Y+X44GR5Y+W44KL77yI5omA6KaB5pmC6ZaT
77ya57SEMeWIhu+8iSAgDQpodHRwczovL3BheWRpcGx1cy1jYXJkLmllcnR1cnkuY29tLz9hcHBs
eT1XTXlvekZWMjFidVMwWDh2WDRXWTdoRTV5cA0KDQrjgJDmnJ/pmZDjgJHmnKzjg6Hjg7zjg6vl
j5fkv6HjgojjgoozMOaXpemWkyAgDQrigLvmnJ/pmZDlvozjga/nibnlhbjjgYzlpLHlirnjgZfj
gb7jgZnjgILjgYrml6njgoHjgavjgZTliKnnlKjjgY/jgaDjgZXjgYTjgIINCg0K44CQ5LuY5LiO
5pmC5pyf44CR44GK5omL57aa44GN5a6M5LqG5b6M44CB57+M5pyIMTDml6Xku6XpmY3jgavlj43m
mKDjgZXjgozjgb7jgZnjgIINCg0K5byV44GN57aa44GN44CB44Oa44Kk44OH44Gn44Gu44GK6LK3
44GE54mp44KS5b+D44KG44GP44G+44Gn44GK5qW944GX44G/44GP44Gg44GV44GE44G+44Gb44CC
DQoNCuKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgCAgDQrvvJzjgYrllY/jgYTlkIjjgo/jgZvvvJ4NCiAg
ICDmoKrlvI/kvJrnpL5QYWlkeQ0KICAgIOOAkjEwNy02MjEyIOadseS6rOmDvea4r+WMuui1pOWd
gjktNy0xIOODn+ODg+ODieOCv+OCpuODs+ODu+OCv+ODr+ODvDEy6ZqODQrilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIAgDQoNCmMgUGFpZHkgSW5jLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
