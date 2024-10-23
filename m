Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E98B9AC6EA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 11:47:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3XxQ-0000Hn-Hn;
	Wed, 23 Oct 2024 09:47:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1t3XxO-0000HR-La
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 09:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bGpLoC3knzXadOWZtYKaVuF5uOI+14bGyUxz/W66kSI=; b=S+9sS0VRshodQahPonv9pHjUM+
 bu2ZWHMY2jgdVah6UxZBfr+BQwFCx/r8JazEKup4yocc0pyBYzfXCCXtMgR7c4JDhI+41J0h5WlE4
 XrdDBaboLafkdEvZn4YVZBk/uyT4wOSTSOGWO5rpe50b0YXNsc3AQotAEg1F8yUmgWjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bGpLoC3knzXadOWZtYKaVuF5uOI+14bGyUxz/W66kSI=; b=lUbU72r5A9vv8iHOH6Of8epUim
 6NYXjGmBSUtbs1sRpLIByazrSWeuUkFazQnSNtnU0D9HIeT+MTBryd6qH0EqzLpX3GaRzJhctAlxL
 B33qC2/bTw5mLtj2rHUBmOZNFadzcYTHgWYPi2Rj1ylRAz8w6aXyL8EOV0hDbXEgSMGw=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3XxL-0006Wa-DL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 09:47:10 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20241023094654epoutp024f1874d1834aaf38f56c67ea4065b161~BC_YHkwch2080620806epoutp02X
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 23 Oct 2024 09:46:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20241023094654epoutp024f1874d1834aaf38f56c67ea4065b161~BC_YHkwch2080620806epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1729676814;
 bh=bGpLoC3knzXadOWZtYKaVuF5uOI+14bGyUxz/W66kSI=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=HLcWtUe6xdWIfIfYobiGVYo6946fEOIVr1vHTfa9SmRWQzhkW+yWwnTzh+lO1Shaw
 lACQdbg+eOiWLX6ieMtJ1ChtFbr8RvYmhSUa1PQxz4sCn8WHKTy5n6Rj47kT3++RTK
 kjHmyJ/WzvKPApUVi3Jc9hqR24BoSUFCYngbbt1Q=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20241023094654epcas2p2ce40bff90e6e03b8a12b5d9b0e542a11~BC_X4DF5I3068730687epcas2p2G;
 Wed, 23 Oct 2024 09:46:54 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.91]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4XYPMd4XTZz4x9Q8; Wed, 23 Oct
 2024 09:46:53 +0000 (GMT)
X-AuditID: b6c32a43-7b1b87000000216f-f3-6718c60d579a
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 33.54.08559.D06C8176; Wed, 23 Oct 2024 18:46:53 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "chao@kernel.org" <chao@kernel.org>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20241022083623.2641434-1-chao@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20241023094553epcms2p1c4b830a99a1f6b10cba8fd9bbcd8e2ac@epcms2p1>
Date: Wed, 23 Oct 2024 18:45:53 +0900
X-CMS-MailID: 20241023094553epcms2p1c4b830a99a1f6b10cba8fd9bbcd8e2ac
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdljTVJf3mES6wbMvShanp55lsnh5SNNi
 1YNwiyfrZzFbXFrkbnF51xw2i7+7brA5sHtsWtXJ5rF7wWcmj74tqxg9Zr5V8/i8SS6ANSrb
 JiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoBCWFssSc
 UqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsaF
 DTNYC5ayVNxq2svYwPiAuYuRk0NCwETi/5ylTF2MXBxCAjsYJZ78fgzkcHDwCghK/N0hDFIj
 LJAusbBpMguILSSgJLH+4ix2iLiexK2HaxhBbDYBHYnpJ+6DxUUEQiSa7jaxgcxkFtjOJHGz
 +S/UMl6JGe1PWSBsaYnty7eCNXMKmEtM7N7BBBHXkPixrBeqXlTi5uq37DD2+2PzGSFsEYnW
 e2ehagQlHvzcDRWXlLg9dxNUfb7E/yvLoewaiW0H5kHZ+hLXOjaC3cAr4Cuxt+MKWJxFQFVi
 ++dnULe5SDx8fRzMZhaQl9j+dg4zKEyYBTQl1u/SBzElBJQljtyCquCT6Dj8lx3mw4aNv7Gy
 d8x7AvWhmsS6n+uZJjAqz0IE9Cwku2Yh7FrAyLyKUSy1oDg3PTXZqMAQHrfJ+bmbGMGJUct5
 B+OV+f/0DjEycTAeYpTgYFYS4VUqEU0X4k1JrKxKLcqPLyrNSS0+xGgK9OVEZinR5Hxgas4r
 iTc0sTQwMTMzNDcyNTBXEue91zo3RUggPbEkNTs1tSC1CKaPiYNTqoHJ6jnjsRzV2Fdf8uY+
 6PuuGaCvmBJT4eBp/DpozYtrDX8u39lvK2bj6vOm50yXZsex5vQ0JyffrO/X6xmFjYS+ZjkK
 PPwVeVEtIK25kGFLWHfPt8PP9z61Lsjasyuv41n9TYklE7f8tNsolKPHp33vzarg4M8ntl3u
 /yLOnN29PXbZ+1dSkudm7Au/zTshL/Sf7frMJ4cNKj7ejzA1eX3hEc+ed+knt/28WdI981Gt
 r20UD1fL1tpDnY118/sTXoUuY5M+dOn3OpFmv7lxLrWlD0LOWX+oE9CyvzlhD1ti4xKTX5Mk
 WdW+1HB8TcwNzijqMb9ToxOd/vKrq8ylbXpOx+rSX4i7sZsZfQ6Zwq7EUpyRaKjFXFScCADi
 gECHFQQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241022083741epcas2p3f9ca0827f9501134124fd47979e70cbc
References: <20241022083623.2641434-1-chao@kernel.org>
 <CGME20241022083741epcas2p3f9ca0827f9501134124fd47979e70cbc@epcms2p1>
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao Yu, > ... > > Let's always create an asynchronous
 task in f2fs_handle_critical_error() > rather than calling
 f2fs_record_stop_reason()
 synchronously to avoid > this potential deadlock issue. > > Fixes: b6 [...]
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3XxL-0006Wa-DL
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid potential deadlock in
 f2fs_record_stop_reason()
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
Reply-To: daejun7.park@samsung.com
Cc: "syzbot+be4a9983e95a5e25c8d3@syzkaller.appspotmail.com"
 <syzbot+be4a9983e95a5e25c8d3@syzkaller.appspotmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao Yu,

> ...
> 
> Let's always create an asynchronous task in f2fs_handle_critical_error()
> rather than calling f2fs_record_stop_reason() synchronously to avoid
> this potential deadlock issue.
> 
> Fixes: b62e71be2110 ("f2fs: support errors=remount-rocontinuepanic mountoption")
> Reported-by: syzbot+be4a9983e95a5e25c8d3@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6704d667.050a0220.1e4d62.0081.GAE@google.com
> Signed-off-by: Chao Yu <chao@kernel.org>

Reviewed-by: Daejun Park <daejun7.park@samsung.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
