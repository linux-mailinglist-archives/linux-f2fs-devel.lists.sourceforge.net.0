Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D05F4A6B6A1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Mar 2025 10:07:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tvYLW-0002mB-CZ;
	Fri, 21 Mar 2025 09:07:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <karol.bednaszewski@ventrixio.pl>) id 1tvYLB-0002kZ-5b
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Mar 2025 09:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g/ZnFTuVYued68oe7XL8RDnKQ+ZMKy0qE+LfBacqvSc=; b=YY9CAf9pro/ahu5etwuX/3cSL9
 7BDBZVQ4HWRCS1cazL0J4037FFqxIwpZk0fSf3fYdGXFa4Rg6ninc343ayDMRu2mh5x+AMfyLJHjT
 QCuCIQiCYs7gPl8DBNWZAAlRj7I5W2uhjaQXm1mfN2+nbNSRRogIK2t4iz4wWRLjUxEE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g/ZnFTuVYued68oe7XL8RDnKQ+ZMKy0qE+LfBacqvSc=; b=P
 hdCFZTvIQ+9j6RFkQilUHePArj4C6OtR7/SturQ9mfk1L6z21afQbz3bU7dLkTn9kzSS36UGIp90j
 mDhhegTX/avBcGXTTj0r0yOnURlNI94bGA5XQ3fHTKGMYRPoK3u8R/jG0lYG7WSc/VJ5cFO8iLLj9
 +hqRoC2DjspXo/eo=;
Received: from mail.ventrixio.pl ([57.129.137.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tvYLB-0007VQ-90 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Mar 2025 09:06:57 +0000
Authentication-Results: ventrixio.pl; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=ventrixio.pl; s=default; a=rsa-sha256; cv=none; t=1742547949; 
 b=1OpeY7sq+xFQkLGTMdLSCuiLrlrvb/+vq63bWvdrKz8IzbeWpPNE/yFVNjDYCgxWED16
 QMSZ2EUpnyDlA13uDFhMlel/5ES05TWWtjDPfjzrXWWl5I3ql0opBXqh4hXtDzJVYX++k
 c6rGHKopK1YKV5R3wiwl+/oV3Ykc1LB1fE6L9rg1T6KNIyaUckrDoVk3FCz6m0OBXlA6C
 /CMTd6vRzcYtxRwrgK7cqyVDd78JTX0ThPbFGi8+JCZbf2Sl6dGeIQKtnWPXUAcHhUqHu
 Sq2S38ev/cw5p04sfHTZe0P5oU4MuURrHWvRBdtmnGXdLowRkfz0stOwPfzpeCn507g==
ARC-Message-Signature: i=1; d=ventrixio.pl; s=default; a=rsa-sha256;
 c=relaxed/simple; t=1742547949;
 h=Message-ID:Date:From:Subject:From;
 bh=g/ZnFTuVYued68oe7XL8RDnKQ+ZMKy0qE+LfBacqvSc=;
 b=N8BQIW+myYPVUmekUtjhlkhhm/rODkIQC2QaGuHIR6qMe2fH9hLtuXEGyzfCcOjaVpjx
 mX/ecvZmlMav4+722EyAMV+hZ1ZIH9HSu+4hJ8rNvTDY5jPL9GO0ieoI+kg/OSHWMva+H
 bj06Kjq9sMUBvhBxa4Zu1r7EsBbzcjrpJLER2LqVByczlJNjV7M4stzCzM6PwjwMPd20k
 e0EcnKnG6NXKYwVbN3ie3VTFVAdr1melpgRSNk931MisHfulvm+VVt2InL+ID7g9vxIqk
 6B1ixkBIb13S0+gcRKbnAPvoUfLQ3soJ+0QTsRFyqGHDQ50M1n5+wXngowHcIYb48Zg==
ARC-Authentication-Results: i=1; ventrixio.pl;
 arc=none smtp.remote-ip=127.0.0.1
Received: by mail.ventrixio.pl (Postfix, from userid 1002)
 id 84A6A232CB; Fri, 21 Mar 2025 09:05:34 +0000 (UTC)
Received: by mail.ventrixio.pl for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Mar 2025 09:05:18 GMT
Message-ID: <20250321074500-0.1.17.9qth.0.gpl081s8r2@ventrixio.pl>
Date: Fri, 21 Mar 2025 09:05:18 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.ventrixio.pl
MIME-Version: 1.0
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dzień dobry! Czy mógłbym przedstawić rozwiązanie, które
    umożliwia monitoring każdego auta w czasie rzeczywistym w tym jego pozycję,
    zużycie paliwa i przebieg? Dodatkowo nasze narzędzie minimalizuje koszty
    utrzymania samochodów, skraca czas przejazdów, a także umożliwia tworzenie
    planu tras czy dostaw. 
 
 Content analysis details:   (2.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [57.129.137.141 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [57.129.137.141 listed in bl.score.senderscore.com]
  2.0 PYZOR_CHECK            Listed in Pyzor
                             (https://pyzor.readthedocs.io/en/latest/)
  0.0 FSL_BULK_SIG           Bulk signature with no Unsubscribe
X-Headers-End: 1tvYLB-0007VQ-90
Subject: [f2fs-dev] =?utf-8?q?Mniejsze_wydatki_na_samoch=C3=B3d?=
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
From: Karol Bednaszewski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Karol Bednaszewski <karol.bednaszewski@ventrixio.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RHppZcWEIGRvYnJ5IQoKQ3p5IG3Ds2fFgmJ5bSBwcnplZHN0YXdpxIcgcm96d2nEhXphbmllLCBr
dMOzcmUgdW1vxbxsaXdpYSBtb25pdG9yaW5nIGthxbxkZWdvIGF1dGEgdyBjemFzaWUgcnplY3p5
d2lzdHltIHcgdHltIGplZ28gcG96eWNqxJksIHp1xbx5Y2llIHBhbGl3YSBpIHByemViaWVnPwoK
RG9kYXRrb3dvIG5hc3plIG5hcnrEmWR6aWUgbWluaW1hbGl6dWplIGtvc3p0eSB1dHJ6eW1hbmlh
IHNhbW9jaG9kw7N3LCBza3JhY2EgY3phcyBwcnplamF6ZMOzdywgYSB0YWvFvGUgdW1vxbxsaXdp
YSB0d29yemVuaWUgcGxhbnUgdHJhcyBjenkgZG9zdGF3LgoKWiBuYXN6ZWogd2llZHp5IGkgZG/F
m3dpYWRjemVuaWEga29yenlzdGEganXFvCBwb25hZCA0OSB0eXMuIEtsaWVudMOzdy4gTW9uaXRv
cnVqZW15IDgwOSAwMDAgcG9qYXpkw7N3IG5hIGNhxYJ5bSDFm3dpZWNpZSwgY28gamVzdCBuYXN6
xIUgbmFqbGVwc3rEhSB3aXp5dMOzd2vEhS4KCkJhcmR6byBwcm9zesSZIG8gZS1tYWlsYSB6d3Jv
dG5lZ28sIGplxZtsaSBtb2dsaWJ5xZtteSB3c3DDs2xuaWUgb23Ds3dpxIcgcG90ZW5jamHFgiB3
eWtvcnp5c3RhbmlhIHRha2llZ28gcm96d2nEhXphbmlhIHcgUGHFhHN0d2EgZmlybWllLgoKClBv
emRyYXdpYW0KS2Fyb2wgQmVkbmFzemV3c2tpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
