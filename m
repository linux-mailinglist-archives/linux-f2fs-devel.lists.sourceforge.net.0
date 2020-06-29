Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1167220D2C5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2020 21:08:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpz91-0002WM-7N; Mon, 29 Jun 2020 19:08:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sandeen@redhat.com>) id 1jpz90-0002WE-HQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 19:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n2qVe7QVtMWlsu3tW293XYJBZ3r5SYGfqQyhGd9NB2s=; b=eetQwMD6p/cvh+SrBVMA55pUy1
 QCwbXClIKiPP3QogCDzuvmEVSC1QhI7Cv9TwjOgfSdGaXMoRQHbSeQw1yWrWkOBTHbUdEDryi732N
 11BhF7RTAUn46P0BDhxbA3BlXrS8uU+uaPLcdcr5zu4FtQYG/zeQF+7QlHIMRvakFghA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=n2qVe7QVtMWlsu3tW293XYJBZ3r5SYGfqQyhGd9NB2s=; b=D
 63uHhMeI119tID3CAUGZeGwdJI1uaecRJqdSOloLdx98+fwPGSh0lkWbecOVUF01g5zncEtj6HroY
 jMLBRpT8+vErdZjowkbQnp3MMNYw+hbnrdHtc2cgl8Qdeu+f3HbK0BLaHWRrBdmOkscGD3KRrYlRR
 095gLn0/kanJWHkU=;
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1jpz8w-006Rxk-1r
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 19:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593457711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n2qVe7QVtMWlsu3tW293XYJBZ3r5SYGfqQyhGd9NB2s=;
 b=XRjYU5JimiubO2FeaY1ODPYLy1lh4ZTy9jCOhS2q3e8RiaATO26qd19t5ulzYMEHI6WrH0
 txN9ZBuM76ECH3B1iM94HRck+okZP6iYC6y4xDIrqRKId0+R6cL/MvdHk38m46m5PVYQF6
 Mol/G0ksWY75Wa9VGlPl+pO9Ihmd9Y4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-L3fpmOSlM7CetVm3iyl5YQ-1; Mon, 29 Jun 2020 15:08:13 -0400
X-MC-Unique: L3fpmOSlM7CetVm3iyl5YQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3B1210059A3;
 Mon, 29 Jun 2020 19:08:11 +0000 (UTC)
Received: from [IPv6:::1] (ovpn04.gateway.prod.ext.phx2.redhat.com [10.5.9.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 074F960BF3;
 Mon, 29 Jun 2020 19:08:10 +0000 (UTC)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan Corbet <corbet@lwn.net>
Message-ID: <c8271324-9132-388c-5242-d7699f011892@redhat.com>
Date: Mon, 29 Jun 2020 14:08:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.139.110.120 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpz8w-006Rxk-1r
Subject: [f2fs-dev] [PATCH] doc: cgroup: add f2fs and xfs to supported list
 for writeback
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
Cc: linux-xfs <linux-xfs@vger.kernel.org>, cgroups@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs and xfs have both added support for cgroup writeback:

578c647 f2fs: implement cgroup writeback support
adfb5fb xfs: implement cgroup aware writeback

so add them to the supported list in the docs.

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---

TBH I wonder about the wisdom of having this detail in
the doc, as it apparently gets missed quite often ...

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index ce3e05e..4f82afa 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1684,9 +1684,9 @@ per-cgroup dirty memory states are examined and the more restrictive
 of the two is enforced.
 
 cgroup writeback requires explicit support from the underlying
-filesystem.  Currently, cgroup writeback is implemented on ext2, ext4
-and btrfs.  On other filesystems, all writeback IOs are attributed to
-the root cgroup.
+filesystem.  Currently, cgroup writeback is implemented on ext2, ext4,
+btrfs, f2fs, and xfs.  On other filesystems, all writeback IOs are 
+attributed to the root cgroup.
 
 There are inherent differences in memory and writeback management
 which affects how cgroup ownership is tracked.  Memory is tracked per



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
