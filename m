Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7D35BEF15
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Sep 2022 23:23:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oakiC-0006UW-7W;
	Tue, 20 Sep 2022 21:23:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oaki1-0006UP-Nz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 21:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DBWQe7VBv4hMGPs/WuU3P7b9CdcR81d5D6liR7m4hHw=; b=ReIxjSiJFQW7WlqkVq40RNa70m
 ZWkqzzeZ8EvBcxinuZjmUCvp2tnTEB3eInqpdW4zo1lJJlj2A039RZdQGWusUu81yF39k0myRg4v+
 kefByTCEnnZksuPBmg4m3sRqqKvpYt1ffFznE+in/vE7rKGQ6SdQ3XMj+01a5yoe5bR8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DBWQe7VBv4hMGPs/WuU3P7b9CdcR81d5D6liR7m4hHw=; b=hm96H9c20MBqpi2nnUaguho2jy
 IG0KUmfJcpnhlVqQDMHj+jNkrwq8ZpW5oc7qxoUbSPb8bdgcj6Ufckl6bShrDnrlsT6NCQYVEUcie
 +B+YaRZK6patFZzVbi9FQgG6StY0JSFASU7STWat+c0KjUv6Tob2ZsrgVJ8VrkbbjFgs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oakhx-00Epqb-Fe for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 21:23:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E3B3621A3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Sep 2022 21:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6ACDBC433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Sep 2022 21:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663708983;
 bh=kDvh8981zfRxfMvoF/+Y338lcoQEecl4uLTD5HnGfO4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lC08iQUxuy4fuGgNlx7VYKUVWFFIDmNBjHWYeYoXWlAOkGd55wVe9ihwwB0CkdwwN
 JOVRbrtZWnqkLpjXtTz7dtpUucNuxPYdyAbhHj08lWxs/NvGF2c0dkhOA5tSjujVEW
 4pDKZUUNdFR9EyoC0IEtcnDjK5HuS6vyOgXbxAF4LzGTQXEdL15AHevCGsqNsHH+OW
 20s0iJnMbERC5G2t37l4abAojUFvYvdKDVhzhMSyK27Lp8h195YvxrTivynGnslMUe
 zEW/bOJmI9Enlhu95JCXFoYz672skvoDii08HWD5RVohGqAAq0xk0bqijn02xrNc4c
 afi/Zsf5usQUw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4E962C433E6; Tue, 20 Sep 2022 21:23:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 20 Sep 2022 21:23:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yuriy.garin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-sWWOCeToxK@https.bugzilla.kernel.org/>
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
 #59 from Yuriy Garin (yuriy.garin@gmail.com) --- Please forgive my ignorance, 
 I'm sure I'm getting it wrong. How this 'goto repeat' supposed to break a
 cycle? Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oakhx-00Epqb-Fe
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

--- Comment #59 from Yuriy Garin (yuriy.garin@gmail.com) ---
Please forgive my ignorance, I'm sure I'm getting it wrong.

How this 'goto repeat' supposed to break a cycle?

Here is a simplified code of f2fs_get_lock_data_page():

struct page *f2fs_get_lock_data_page(struct inode *inode, ...)
{
repeat:
        /* get page by inode - from cache or disk */
        struct page *page = f2fs_get_read_data_page(inode, ...);
        if (page->mapping != inode->i_mapping) {
                /* page has bad mapping */
                f2fs_put_page(page, 1); /* put page bad mapping back in cache
*/
                goto repeat; /* do it again, without changing anything */
        }

        return page; /* good */
}

We look by inode for a page - in cache or disk.
Got page, but it has a "wrong" mapping.
We put a page - with "wrong" mapping - back into cache.
And, without changing anything - in inode info or page info - we are trying to
get a different result by doing the same thing with the same conditions.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
