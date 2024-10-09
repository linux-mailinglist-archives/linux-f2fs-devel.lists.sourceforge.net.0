Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5799644F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Oct 2024 11:01:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sySZL-0005Iy-80;
	Wed, 09 Oct 2024 09:01:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <info@sonaerauco.com>) id 1sySZJ-0005Ir-OD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Oct 2024 09:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2/2mKxGMcjfhcvbyEvcz+HjjcjOtUZ13IAd13iprO4o=; b=GbIOYNtHWRvR9EpNmo5uRfwIPh
 DBVnlcEWPHrYxnseqoHXKwLaQqd6+1es3GGi0UPStQ7o9+tc8jf6eSeAlVejHjyUYi2YIMsKAXCHJ
 aTdR2V3Iz6XaZ0mv1X4Nwa84LMKSmvFmRmQAb2p7I4QiGR4xjtUYaPbGFl6yVSXMMFOU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2/2mKxGMcjfhcvbyEvcz+HjjcjOtUZ13IAd13iprO4o=; b=Z
 aZ8CjyrjueG7K+ADqYHAu7CJOuCg/OdcGKXW7kUgLXlCpO3CiJ+O1k6YQFaMaeV+YVdsKiixDjOBQ
 Rg/YZM/PKhW33PtItNOZAmFsHbsYnqXJWGR5wY5F0Wv9nSK1Oy2URE4cKVJB7Mtvxwjey4prjLjID
 jCda2zwwiv7j23Uw=;
Received: from mail1.sonaerauco.com ([172.96.137.220])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sySZI-0005Fi-Fy for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Oct 2024 09:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default;
 d=sonaerauco.com; 
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=info@sonaerauco.com;
 bh=2/2mKxGMcjfhcvbyEvcz+HjjcjOtUZ13IAd13iprO4o=;
 b=ufcLzMtb1v4pvcisHNTkh89vU2QadLfMYUmxMvdm0FHCTSijAUauiivZRO7H62tj/1ayap6y8C0p
 x/ey7zXvAPwUtzrcbZ4cZYFp3gveTIQRjjYtbQ1NHKfhShdb2OlcDHZtHSu9qtYsQ8pyS+xzSDJb
 u0524sb7Sx7BxITv9xc=
From: =?UTF-8?B?57Gz5Zu96YCj6YKm5rqW5YKZ6YqA6KGM?=<info@sonaerauco.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 9 Oct 2024 02:01:05 -0700
Message-ID: <20241009020105.7E04964E57F5BF4B@sonaerauco.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  拝啓 米国中央銀行（連邦準備制度）は、当社のソフトウェアがインターネット詐欺の被害者をすべて検出するシステムを構築したことをここに通知し
    ま� [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [172.96.137.220 listed in wl.mailspike.net]
X-Headers-End: 1sySZI-0005Fi-Fy
Subject: [f2fs-dev] =?utf-8?b?57Gz5Zu96YCj6YKm5rqW5YKZ6YqA6KGM44KI44KK?=
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
Reply-To: enquiry@usfedreserve.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5oud5ZWTCgoK57Gz5Zu95Lit5aSu6YqA6KGM77yI6YCj6YKm5rqW5YKZ5Yi25bqm77yJ44Gv44CB
5b2T56S+44Gu44K944OV44OI44Km44Kn44Ki44GM44Kk44Oz44K/44O844ON44OD44OI6KmQ5qy6
44Gu6KKr5a6z6ICF44KS44GZ44G544Gm5qSc5Ye644GZ44KL44K344K544OG44Og44KS5qeL56+J
44GX44Gf44GT44Go44KS44GT44GT44Gr6YCa55+l44GXCuOBvuOBmeOAggoK44Gd44Gu57WQ5p6c
44CB44GK5a6i5qeY44GM6KKr5a6z6ICF44Gu5LiA5Lq644Gn44GC44KL44GT44Go44GM5YiG44GL
44KK44G+44GX44Gf44Gu44Gn44CB6KOc5YSf44OX44Op44Oz44KS6YCa44GY44Gm5pCN5aSx44KS
6L+U6YeR44Gn44GN44KL44KI44GG44Gr5oOF5aCx44KS44GK5Lyd44GI44GZ44KL44Gf44KB44Gr
44GU6YCj57Wh44GVCuOBm+OBpuOBhOOBn+OBoOOBjeOBvuOBl+OBn+OAggoK44GC44Gq44Gf44GM
5pys5b2T44Gr44Kk44Oz44K/44O844ON44OD44OI6KmQ5qy65bir44Gr6aiZ44GV44KM44Gf6KKr
5a6z6ICF44Gu5LiA5Lq644Gn44GC44KL5aC05ZCI44Gv44CB5b2T56S+44Gr6YCj57Wh44GX44Gm
5L2V44KS5aSx44Gj44Gf44GL44KS56K66KqN44GX44Gm44GP44Gg44GV44GE44CC44Gd44Gu5b6M
44CB5b2T56S+44GvCuaUr+W6l+OBq+aMh+ekuuOBl+OBpuaQjeWkseOCkui/lOmHkeOBl+OBvuOB
meOAggoKWW91cnMgc2luY2VyZWx5Ck1ycy5MYXJuYmVydGkgSnVhbgpVU0EgRmVkZXJhbCBSZXNl
cnZlCkFkZHJlc3M6IDE4NTAgSyBTdHJlZXQsIE5XLAozcmQgZmxvb3IsIGluIFdhc2hpbmd0b24g
VVNBClVTQSBGRURFUkFMIFJFU0VSVkUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
