Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA6D82BB81
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 08:13:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOBj5-0001rp-4q;
	Fri, 12 Jan 2024 07:13:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1rOBj3-0001ri-FZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 07:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VCEqIivkHRIrYsw4MOEaXLZlutGhQyNEOuISiki+wOM=; b=OZpDUJJZ1oicgYt4cQVTItyLex
 SWxQy5BWNAFeQXBFw7flDrL1fcVmJxY71Yqcg29LG5ETqjnwJsV8wvKVJUcNavKWWZEfTXFZd7J/j
 E72tzUL4UG7RRDq9snF9XTIMSpY/yoHjZ+IUxmSr6SqQmGgqae+C3mV0w7PCTVEoC6Dk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VCEqIivkHRIrYsw4MOEaXLZlutGhQyNEOuISiki+wOM=; b=S6cqNLqPLTsFSRPqbKIwjKGXe0
 +z9tl1SlVQk2YHWZqdvbpSTxsv0Ehdohi9n3h2miJTs91xTxWyFaXSKApFfLA1NimFujs9snti6aZ
 leLbD0Totn10N3pi/m022DKm7ed+lwDC3PPNHuh/obskNur8D0NgkjwI4c1U9PlgWnRg=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOBiw-0002j7-AS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 07:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VCEqIivkHRIrYsw4MOEaXLZlutGhQyNEOuISiki+wOM=; b=W2B/Y4R4AIGJarjY9sQq+lbTg7
 pqy5MthOXo0dJ1LTA4vrqeusN7lE70iX9dKDy5UTb7u31UkcQdzjpV+NIv19GbcENjkjQpsnDGu/K
 NVnI0M1bSS8WMMwupiu+VZapWMag7LrIehc0IWqTDeMev0+JreCdd/uJR0kSAyvRZaZ3+QeJjvLVG
 6AF1r5uLxS6AdEbaMEsfnLiAJcICBjI0FkhpmIIChPCLRlgMVEE0/cUz6S23h1rwv+93cS4tdTYZQ
 Y0KFmHsbeNZQ3eTcDXGCPLBLMNNebOc1OELp4DwVB6bMnw8CY5Lfd4VqhuZiSdiyGQZFLd2oeYL1w
 6Imo4YMg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rOBic-00E5Wm-1r; Fri, 12 Jan 2024 07:12:42 +0000
Date: Fri, 12 Jan 2024 07:12:42 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20240112071242.GA1674809@ZenIV>
References: <ZaAzOgd3iWL0feTU@google.com>
 <CAHk-=wgTbey3-RCz8ZpmTsMhUGf02YVV068k3OzrmOvJPowXfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wgTbey3-RCz8ZpmTsMhUGf02YVV068k3OzrmOvJPowXfw@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 11, 2024 at 09:05:51PM -0800,
 Linus Torvalds wrote:
 > On Thu, 11 Jan 2024 at 10:28, Jaegeuk Kim <jaegeuk@kernel.org> wrote: >
 > > > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2 [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rOBiw-0002j7-AS
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.8-rc1
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 11, 2024 at 09:05:51PM -0800, Linus Torvalds wrote:
> On Thu, 11 Jan 2024 at 10:28, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.8-rc1
> 
> Hmm. I got a somewhat confusing conflict in f2fs_rename().
> 
> And honestly, I really don't know what the right resolution is. What I
> ended up with was this:
> 
>         if (old_is_dir) {
>                 if (old_dir_entry)
>                         f2fs_set_link(old_inode, old_dir_entry,
>                                                 old_dir_page, new_dir);
>                 else
>                         f2fs_put_page(old_dir_page, 0);

Where would you end up with old_dir_page != NULL and old_dir_entry == NULL?
old_dir_page is initialized to NULL and the only place where it's altered
is
                old_dir_entry = f2fs_parent_dir(old_inode, &old_dir_page);
Which is immediately followed by
                if (!old_dir_entry) {
                        if (IS_ERR(old_dir_page))
                                err = PTR_ERR(old_dir_page);
                        goto out_old;
                }
so we are *not* going to end up at that if (old_is_dir) in that case.

Original would have been more clear as
	if (old_is_dir) {
		if (old_dir != new_dir) {
			/* we have .. in old_dir_page/old_dir_entry */
			if (!whiteout)
	                        f2fs_set_link(old_inode, old_dir_entry,
                                                old_dir_page, new_dir);
			else
	                        f2fs_put_page(old_dir_page, 0);
		}
                f2fs_i_links_write(old_dir, false);
	}
- it is equivalent to what that code used to do.  And "don't update ..
if we are leaving a whiteout behind" was teh bug fixed by commit
in f2fs tree...

The bottom line: your variant is not broken, but only because
f2fs_put_page() starts with
static inline void f2fs_put_page(struct page *page, int unlock)
{
        if (!page)
                return;

IOW, you are doing f2fs_put_page(NULL, 0), which is an explicit no-op.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
