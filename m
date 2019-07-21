Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E20616F62C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jul 2019 23:41:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpJZn-0000SE-Mg; Sun, 21 Jul 2019 21:41:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpJZm-0000S7-T9
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 21 Jul 2019 21:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Sender:Reply-To:Message-ID:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GamDa9e6ykxwJE/OT9rZdgap5CrFuSpemmshoVfPTmw=; b=hwTzguVuzw+phD8LABH63SYidJ
 VUjo2Tu+NpKa094Vyh/hR3agQrHzP+6lWny4JDqzNqyh7SNydVjcyyAgKmrRITBd8eFK/24C42si6
 8sMFqq3LaY6lBKPT/B88AzDLtq43r+Sbl4w/q3f2eqieuIzBNalZFvI7qUQXHrf1mw1A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Sender:Reply-To:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GamDa9e6ykxwJE/OT9rZdgap5CrFuSpemmshoVfPTmw=; b=X
 12+FUg63Ue+zVj44JxXXvBXL2PeMuQNHO5mGHCaKCAbv+GrLR91hn26u79rGBid0GBW/LMYzhGFj5
 S4mPdwU7ZO+qEtXRhF3kIns3VYqRsZMkks3gwnk1Tiead7e6QISFnosrtqh3hPkaDhuWSrd03jqzU
 +934BT81ENQg7Vc0=;
Received: from mout-bounce.kundenserver.de ([212.227.15.56])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hpJZk-009ZRA-N7
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 21 Jul 2019 21:41:02 +0000
Received: from localhost by mout-bounce.kundenserver.de id
 0MPmkM-1hlRh91fpS-0050Wd Sun, 21 Jul 2019 23:40:53 +0200
Date: Sun, 21 Jul 2019 23:40:53 +0200
From: "Mail Delivery System" <mailer-daemon@kundenserver.de>
To: linux-f2fs-devel@lists.sourceforge.net
Auto-Submitted: auto-replied
MIME-Version: 1.0
X-UI-Out-Filterresults: unknown:0;V03:K0:OPvML9ynAcY=:Y+pB2T6Sl8qb6aW0fAOEcg ==
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: r6themes.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [212.227.15.56 listed in list.dnswl.org]
 1.0 MISSING_MID            Missing Message-Id: header
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hpJZk-009ZRA-N7
Subject: [f2fs-dev] Mail delivery failed: returning message to sender
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Message-Id: <E1hpJZn-0000SE-Mg@sfs-ml-2.v29.lw.sourceforge.com>

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of
its recipients. This is a permanent error. The following address(es)
failed:

hello@r6themes.com:
SMTP error from remote server for TEXT command, host: mx10.mailspamprotection.com (108.163.220.50) reason: 550 212.227.126.130 is not allowed to send mail from lists.sourceforge.net
. Please see the SPF record, with scope mfrom, identity linux-f2fs-dev
el@lists.sourceforge.net, and ip 212.227.126.130



--- The header of the original message is following. ---

Received: from infong178.kundenserver.de ([82.165.86.222]) by
 mrelayeu.kundenserver.de (mreue009 [172.19.35.7]) with ESMTPA (Nemesis) id
 1M42fA-1hpJZa0FJg-000213 for <hello@r6themes.com>; Sun, 21 Jul 2019 23:40:50
 +0200
Received: from 185.17.149.164 (IP may be forged by CGI script)
    by infong178.kundenserver.de with HTTP
    id zRI2ZU-1hbaK73PGA-00F8v9; Sun, 21 Jul 2019 23:40:49 +0200
X-Sender-Info: <71652312@infong178.kundenserver.de>
Precedence: bulk
To: hello@r6themes.com
Subject: Earnings on the Bitcoin course from $ 2500 per day
Date: Sun, 21 Jul 2019 21:40:49 +0000
From: ShawnFlils <linux-f2fs-devel@lists.sourceforge.net>
Message-ID: <144543cb147b85bd7241fadc4dfb14a3@architektheubel.de>
X-Mailer: PHPMailer 5.2.22 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pKmS/gGcCGQaRJfQkbeUzSk54az8AyHnxkE2EzxvAvQlQk2bFkw
 /gpci5mid9UP/ganFHx48lAx6Gs9rW2O4F+MOIz8063/e1z7E77BFl3UhYw/Jx8faNRgZGU
 fSQIMH19P68/AqMnp8ox5+O5vsRutPS3nKu1ZukJlD5v2jVKKljLYBVrJhLYFLAFOM6R3kw
 ch5bXi34C2X9+nW4ogenHZ8krpuiQaAUYcqV5wIdig=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wRxyXvEhGMo=:+FMsjpjysDHHbqQL37gpX5
 aKfs2KAdohkuA2tJUxeqaPooBm/mqgrY01iC9KdPjo3PHqNW7AZ0PohYY3iFDDHQfhR2pDEyv
 +8Jchow8n4hFBxKTQmzbzqCJB198I2EMxIp4saBixTV6SDV7xWCV5FfSckghx9odO0HQOpnkF
 8MY1uzdK01NCYZjeThaNYW/c4Gf/2NxW7OTzqcj/NdGUF08lPzbiT+mqZw6JHBki49q4fWoZn
 cZJ+fhJWrdrwUUTLFa7ROl2lBccrAJAwOYzwo3k3tuLWQpF6u3OGu67MHj/fDous2CCTliFwS
 dj05qf9oHKUR6+tGL+/Y/9FGK0CSnb2PDdZ1fCDXtaq3YtACTcpMd4pGDckmwdQoK1LRNEu8O
 RSY+nWeC+MZPyF56+SXmJiiiwoolurceWpyBvl1A/Y2YOWpUapxNUX/ypMNMKB0ZerTKvhyU8
 +igW8wazgih89WwnVAtPRBKETb3o4sqiPTCMtaw1G7QaC5mrC5+IKmCDEcPoDMeIrzPVw79nv
 xa+Eamox6kw7VMlj7fsjQoX/k56WvkBdHSRLVw1zZEN7bVEmmH8J5PLGR7Kw66j90gXq7+4+f
 e908tXjNZJ4IhbrVITtBu34yMhANIcDCsge8ca8qBY47AeJkRSa9XoSz4k4bZ6PQS6i2qem3Y
 9C8cbSTlw2nEFvPxG+S0gh+6el0o9zgsVt+nHQEXuvRsKfyAblYzuJJ5B3TXMti3EfoF31soN
 D0OKyUKTUhkPr+9s7d+bmKuGxGEL1WCNUa5LlLwSC1ClqHuYP1y2YUpPHamEMtZ0GWxgJKKxF
 h1UBkUVYDQKYtwDIE7O/AFIixVzL40INWlRL3QDQ0pIMkiGW6RtYgDr5SXptqJ2hLhvNZoS7w
 k1HU+UBVNfwjSHnd3vRqlGP70V6fweZZSIddCEXB/9Bz94MBkgcOL5zC9OybRWU2GEqHeriHV
 c9AOoYRynC50honRRV5N+XV++5I4q4WC3FuKaemtcAmbga8UN/OFR




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
