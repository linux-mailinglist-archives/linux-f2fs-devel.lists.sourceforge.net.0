Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB976349AA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Nov 2022 22:54:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxbDO-0008F3-Sh;
	Tue, 22 Nov 2022 21:54:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oxbDN-0008Ev-JI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 21:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tvM00CWb+DL/iNGgOI9KbDk5j1i50tjVTm7ed0BwnsA=; b=LsL4yzp4CQ/OrP7q2zDDJAWJ3x
 FP8QzM0/6dv3L8vCc6VmBf3UP2SYg32HhR7U2kgShBq36LD7R0BDp/QWVrDphmu2Pq5PCm/T7PQkZ
 uzs5X1nKnz6jA4I+QH2T+Tck8dJYYqV7gqNCdVAiEuMSxouoc+G/HjKpqfWdTRlF+D8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tvM00CWb+DL/iNGgOI9KbDk5j1i50tjVTm7ed0BwnsA=; b=KeGn1IgyohLD6bmlNWVCPBWNzu
 WSd1z+0o5I2EgBz2RQM4bPKCV3i2X+JDm18qJfEnF9PxJgFuFAGsM53hy0PfIQV5dxAVvigZpfh5Q
 n6Uido40+HPu8yrXYjjmCVOXoBcsze6svWu303KPgPTG27hhMwyhe1+nBxifhd2Dl9Gw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxbDI-00DBLP-3k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 21:54:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA235B81D8D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Nov 2022 21:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A718C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Nov 2022 21:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669154028;
 bh=lGZuchy0DOpFzhVYNHnEyCXVhGvlwhiGud0mNJdEY+M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YBDJF3Jc6PLMbJoTu+M6UTYdvtBL6mpJ7oT7lqw7Mi99xqd9jY4dfkhlSI8dLLF8y
 qFOhwVgVsZj+vjcVzok1XraDe7jzRrz+Hw9zFUCfG2zaD68FsN7N4wMzYCBGHqNvNk
 MOlKah0q8ZQFqB01dvhNqFi64MEupxFgNa9bBLcaJX9YcIGKL27vzvrPdgyqH9AzDs
 cRfxtZrU/RXsFv1s9MxVdSMfvcEt0pJKaF+DxmAXfERFrWTjlkkg8AvUcJESmXpCy5
 amtJL+7+7A+U//Sm+AeH1JNP9gUq7x14py81VmFGKAuu24h+yb/whiwZzDJwsgPKru
 TLt8RDJR4/khg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7B129C433E6; Tue, 22 Nov 2022 21:53:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 22 Nov 2022 21:53:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-h7o5PBoLwM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #90 from Guido (guido.iodice@gmail.com) --- > diff --git a/fs/f2fs/data.c
 b/fs/f2fs/data.c > index a71e818cd67b..c351c3269874 100644 > ---
 a/fs/f2fs/data.c > +++ b/fs/f2fs/data.c > @@ -132 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxbDI-00DBLP-3k
Subject: [f2fs-dev] [Bug 216050] f2fs_gc occupies 100% cpu
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

https://bugzilla.kernel.org/show_bug.cgi?id=216050

--- Comment #90 from Guido (guido.iodice@gmail.com) ---
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a71e818cd67b..c351c3269874 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1325,6 +1325,7 @@ struct page *f2fs_get_lock_data_page(struct inode
> *inode, pgoff_t index,
>         lock_page(page);
>         if (unlikely(page->mapping != mapping)) {
>                 f2fs_put_page(page, 1);
> +               f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
>                 goto repeat;
>         }
>         if (unlikely(!PageUptodate(page))) {


this patch seems to avoid the 100% cpu occupation but still doesn't solve the
bug. I was wrong in the last comment, it's an improvement!

As a workaround I tried to build the f2fs module from 5.17 but I failed. I'm
not an expert, so I don't know how to forward-port the module.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
