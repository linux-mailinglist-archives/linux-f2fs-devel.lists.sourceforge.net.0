Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 852C8D0E8BC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Jan 2026 11:12:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MJEb9h9IMV4DZ9cc5IWrhQupjlTpxPeuvEC23MhBbFU=; b=J5kA95TOMRGUSs6+u5YUTg8hGk
	mm/CJ/0L0a+ctmmgx8KbkEmcwHkWbjL5Lc+u0H6bmH9OwYSQTaRFgz1S/Ok38moStSt5jIsYiiSpf
	O3Nrrfpjkquww1faD7MVCzAU1NUwhPZRNkUEBZcY/47ZvDF0PE4Lj5TnGHrPieMgRPOc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vesR8-0003nB-Vt;
	Sun, 11 Jan 2026 10:12:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vesR7-0003n4-8D
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Jan 2026 10:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h3n8BopGg8GfN20IiZxGhwRxejoB1r3r9Qimx4vkLDU=; b=MEHgDCpQjaJud61a5VbK8H2eSH
 2HGeEcBgz1+Nzw+6G7lcaJfVdgq50z39Zmz74iwukKaqFOy5jYnf0Z6Jz/d9157H3iZeDxh95KxuN
 nURoYGyxYZjcUZ5HsGXK+mIiJrMCTlLrdZ49DYzmtJGNKP+vTpLYmdD2xKy9nB8qaFvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h3n8BopGg8GfN20IiZxGhwRxejoB1r3r9Qimx4vkLDU=; b=m
 72/UNpNpVmcwiA8I9hQKTHwZ+oJ/gIH/gVX+qxu8zMcP74J0i3AwfZOmzaxgKPzQkrkSHs34JrXi+
 gQ+1Tc2AlYzHyh6B8waDrBUXlNyos123aG/LjpTpMx4Y3Drg8sqWN6+4zo36BXG1jbp1WNADA0flB
 npAwWuCYKcNrsCAA=;
Received: from m16.mail.126.com ([117.135.210.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vesR6-0004td-5V for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Jan 2026 10:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=h3
 n8BopGg8GfN20IiZxGhwRxejoB1r3r9Qimx4vkLDU=; b=Zq9crD9ZS+yECE8TuK
 A6JCsIHHMyIGqVCoMpdA/wzY1qFnEQ2S4ZS4pybO9ulByKRqsMB6tmnIF4Ms214y
 x0QyBtvP4dMWx7MJFjYRWcVrNHZurMLuQDxJWkvHZVBSPZtmYGPpj9Hu2vN4Ie5N
 +1d0a6LCHd+oP8wsD8f7hu3ks=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wD3lx+Ad2Np0FddBg--.65279S2; 
 Sun, 11 Jan 2026 18:12:17 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Sun, 11 Jan 2026 18:09:39 +0800
Message-Id: <20260111100941.119765-1-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3lx+Ad2Np0FddBg--.65279S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrWF1kAw1DAw45Zr1UJF4ruFg_yoWxXFX_u3
 48ZrykA3yj9FZIkF429rW5XFWvgrW8Zr429F18JFs8C345trZ7Wws0qFy0kF17uF48Gr43
 A3y3Z3s3AryxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNTmh7UUUUU==
X-Originating-IP: [2409:8a20:4df2:4050:484a:1889:71da:fb99]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBowExAWljd4G8bQAA3-
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is v2 of the bug fixes for corner cases in immutable
 file large folio read. The first two fixes from v1 have already been picked
 up, so this reroll only carries the remaining two fixes from v1 (f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [117.135.210.8 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vesR6-0004td-5V
Subject: [f2fs-dev] [PATCH v2 0/2] f2fs: fix large folio read corner cases
 for immutable files
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
Cc: Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is v2 of the bug fixes for corner cases in immutable file
large folio read. The first two fixes from v1 have already been
picked up, so this reroll only carries the remaining two fixes
from v1 (fixing the case where a folio had no BIO submission and
could be left locked, and advance the index and offset after zeroing).

Nanzhe Zhao (2):
  f2fs: add 'folio_in_bio' to handle readahead folios with no BIO
    submission
  f2fs: advance index and offset after zeroing in large folio read

 fs/f2fs/data.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)


base-commit: 2ff2a9420a8221dd4fb45d7e5f60e33f17914a30
--
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
