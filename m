Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E6869DCF1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Feb 2023 10:30:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pUOyS-0004de-F8;
	Tue, 21 Feb 2023 09:30:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pUOyN-0004dX-4o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 09:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ekouilWsZ+lewskDzftQYbemnr9kSKVBOw2GIdcU5XE=; b=bDfSe5/BGrjWcmvaCrkeCx5sqW
 DJg36m3VJfcSXxgEZwTAbTKPj6c2wZ3yCNsSacxUb8nwkEIG1QNVOtBOuQp/kikkC4zVrsLreTUyb
 f5aqoKXnsdlwSuC7Jh/kjcW/yappZz8EbiSF6LFC4/cglib3xcbE8ANgZ2a/xdYauzUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ekouilWsZ+lewskDzftQYbemnr9kSKVBOw2GIdcU5XE=; b=MvgVAnKZ7vtH7DnWpGUf2cdKCM
 uGxJGuYlvRnlL5jnRZZ3h+SE0/GBFeAwF3k4lKOkI5FSSRLOqUNIKGZ+jKWkolV8r8Tz481xxiNDw
 xwNr8hNZwNOBhuWPzd/V1qCj9aVtUsrz+ZEsHQ+txpU+ZtQ/Tddix1hz75lbGjMOnT4c=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pUOyJ-00C7Hj-Ff for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 09:30:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 372E2B80E94
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Feb 2023 09:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7E1DC433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Feb 2023 09:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676971795;
 bh=d6tqnLyNyVHW6icbThQisijRdNEYE5K+r4AycwVXdII=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SbO+MvCOLlaP476xtBtcI8itm1TyzRsoJZsWxferdq1B1mmnP5ZUkrq5lxsYFoSzT
 fDnFqCdzn4ZNczrysj6fn8ZI0G6FyrGzEVwU/Z9/bo8UrdxnwXGvsudyqafdIs5Yts
 veeFNPp5qIsdkJNgRBOqctQmGjjtsUqWT9vK5mjRKlM7Be0IKXq453Dkc88c5yUQq1
 zuN8u6FktzbU6r6wv8n5vB9yyOg62ymj0SI6jbtj8oZ7nmQRP6a8troSrdMq8YpvBU
 rxqX8eJgD7nlAo6q7f20icz0oIrXST0AV5Vc1MMzv4r4SJd+fTPRqIfccVYh0CYEW2
 8q+AH2mDq7Kag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BEE49C43142; Tue, 21 Feb 2023 09:29:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 21 Feb 2023 09:29:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-SMtLtsBcMM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #132 from Guido (guido.iodice@gmail.com) --- (In reply to Jaegeuk Kim from
 comment #131) > Re Comment #122, > > By any chance, could you add a code
 to print "page->mapping->host->i_ino" if [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pUOyJ-00C7Hj-Ff
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

--- Comment #132 from Guido (guido.iodice@gmail.com) ---
(In reply to Jaegeuk Kim from comment #131)
> Re Comment #122,
> 
> By any chance, could you add a code to print "page->mapping->host->i_ino" if
> page->mapping->host exists, and the status of PageUptodate(page)?
> 
> When GC tries to move the valid block, if the block was truncated and
> somehow MM gives a stale page, we may hit a loop?
> 
> How about this to report the error to GC? GC will skip this migration and
> will do it later or skip it, if the block was really truncated.
> 
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1325,18 +1325,14 @@ struct page *f2fs_get_lock_data_page(struct inode
> *inode, pgoff_t index,
>  {
>         struct address_space *mapping = inode->i_mapping;
>         struct page *page;
> -repeat:
> +
>         page = f2fs_get_read_data_page(inode, index, 0, for_write, NULL);
>         if (IS_ERR(page))
>                 return page;
>  
>         /* wait for read completion */
>         lock_page(page);
> -       if (unlikely(page->mapping != mapping)) {
> -               f2fs_put_page(page, 1);
> -               goto repeat;
> -       }
> -       if (unlikely(!PageUptodate(page))) {
> +       if (unlikely(page->mapping != mapping || !PageUptodate(page))) {
>                 f2fs_put_page(page, 1);
>                 return ERR_PTR(-EIO);
>         }

I want to try this patch later. Does the patch try to solve the problem, or
does it only serve to produce a log?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
