Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4D45A53B4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Aug 2022 20:03:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oSj70-00056D-0t;
	Mon, 29 Aug 2022 18:03:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1oSj6u-000566-CE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 18:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=857Rky5sRC+XTJoK32c3SmZHdQxHs6Z39DSeLz0jxjw=; b=j+jm6S6NhOk6isAQ33DQs1sEqT
 c/V2V8ci3JZb5mtnSqYtYKxt+SIyWhNJ6nmQr6iiEGgsEAKP+rnPGyxYV8WPuArgATmqMWKR4O7DI
 hrBveJFYDtau2CK+Rrb7X6/D76XAia7VJOhV8/pKsfgW4uDcEc/pLvF46CPvaAbmZ1Ko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=857Rky5sRC+XTJoK32c3SmZHdQxHs6Z39DSeLz0jxjw=; b=fVQEUwhyoqJihYe3zr3BVV4UdL
 HxoSDL9NvCok9R2IPkif54+AFcze8PPiPKitzBmHRrKAQm9AwGtJf6CuOBX+umOV7SaX5iV6MMrJg
 b4oCyEzZ8S3aFaf3/fEl/CdUE2qK8b6HGfabocqkQieFFSz4wlLimZZYy/xTgP0fPBFQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oSj6q-0004ty-S1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 18:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=857Rky5sRC+XTJoK32c3SmZHdQxHs6Z39DSeLz0jxjw=; b=ie/PIbDnder97CFfOvA/bS9aHh
 Shut/yjGXNOA1Hi1Gl0G4CZlaeev5yYp4xcxHiYj/B+OQ6wPzmElZcuYZLVCkN5Yd0dCqLlfbPKBy
 35f9iyyq5D67aolPfBKc3yj1R6ZiOZF1OtE/KzqrXoWZCVNFS7CcBFcMRMHrHy6J3i1PPiKcVRq8B
 TAQ8kCI0evozqY805wDkhrP6B6WQcKz0J+u6frrMfCRhdxBedhbSRdHZF1r0vYN+FWmRIUMADH9/E
 Vla1+a/2b0dfqBGfS3n11MPhT/lR8x2E/n180bGVpgYVSThMJT5gjdzBHKhgwCOyDF6yqdhMmxOyp
 bbNinWjA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oSj6S-003Hxz-Ia; Mon, 29 Aug 2022 18:03:16 +0000
Date: Mon, 29 Aug 2022 19:03:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Ywz/ZLYqoq85Yrhc@casper.infradead.org>
References: <000000000000d5b4fe05e7127662@google.com>
 <20220825183734.0b08ae10a2e9e1bd156a19cd@linux-foundation.org>
 <Ywz8+WUhypEiUfvk@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ywz8+WUhypEiUfvk@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 29, 2022 at 10:52:57AM -0700, Jaegeuk Kim wrote:
 > On 08/25, Andrew Morton wrote: > > (cc fsf2 developers) > > > > On Thu,
 25 Aug 2022 08:29:32 -0700 syzbot <syzbot+775a3440817f74fddb8c@sy [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oSj6q-0004ty-S1
Subject: Re: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in set_page_dirty
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 syzbot <syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 29, 2022 at 10:52:57AM -0700, Jaegeuk Kim wrote:
> On 08/25, Andrew Morton wrote:
> > (cc fsf2 developers)
> > 
> > On Thu, 25 Aug 2022 08:29:32 -0700 syzbot <syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com> wrote:
> > 
> > > Hello,
> > > 
> > > syzbot found the following issue on:
> > > 
> > > HEAD commit:    a41a877bc12d Merge branch 'for-next/fixes' into for-kernelci
> > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=175def47080000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=5cea15779c42821c
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=775a3440817f74fddb8c
> > > compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> > > userspace arch: arm64
> > > 
> > > Unfortunately, I don't have any reproducer for this issue yet.
> > > 
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com
> > > 
> > > Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> > > Mem abort info:
> > >   ESR = 0x0000000086000005
> > >   EC = 0x21: IABT (current EL), IL = 32 bits
> > >   SET = 0, FnV = 0
> > >   EA = 0, S1PTW = 0
> > >   FSC = 0x05: level 1 translation fault
> > > user pgtable: 4k pages, 48-bit VAs, pgdp=00000001249cc000
> > > [0000000000000000] pgd=080000012ee65003, p4d=080000012ee65003, pud=0000000000000000
> > > Internal error: Oops: 86000005 [#1] PREEMPT SMP
> > > Modules linked in:
> > > CPU: 0 PID: 3044 Comm: syz-executor.0 Not tainted 6.0.0-rc2-syzkaller-16455-ga41a877bc12d #0
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/20/2022
> > > pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > pc : 0x0
> > > lr : folio_mark_dirty+0xbc/0x208 mm/page-writeback.c:2748
> > > sp : ffff800012803830
> > > x29: ffff800012803830 x28: ffff0000d02c8000 x27: 0000000000000009
> > > x26: 0000000000000001 x25: 0000000000000a00 x24: 0000000000000080
> > > x23: 0000000000000000 x22: ffff0000ef276c00 x21: 05ffc00000000007
> > > x20: ffff0000f14b83b8 x19: fffffc00036409c0 x18: fffffffffffffff5
> > > x17: ffff80000dd7a698 x16: ffff80000dbb8658 x15: 0000000000000000
> > > x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> > > x11: ff808000083e9814 x10: 0000000000000000 x9 : ffff8000083e9814
> > > x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
> > > x5 : ffff0000d9028000 x4 : ffff0000d5c31000 x3 : ffff0000d9027f80
> > > x2 : fffffffffffffff0 x1 : fffffc00036409c0 x0 : ffff0000f14b83b8
> > > Call trace:
> > >  0x0
> > >  set_page_dirty+0x38/0xbc mm/folio-compat.c:62
> 
> 2363 void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
> 2364                                         void *src, block_t blk_addr)
> 2365 {       
> 2366         struct page *page = f2fs_grab_meta_page(sbi, blk_addr);
> 
> --> f2fs_grab_meta_page() gives a locked page by grab_cache_page().
> 
> 2367                                                         
> 2368         memcpy(page_address(page), src, PAGE_SIZE);
> 2369         set_page_dirty(page);
> 2370         f2fs_put_page(page, 1);
> 2371 } 
> 
> Is there a change in folio?

Not directly, but there was a related change, 0af573780b0b which
requires aops->set_page_dirty to be set; is that perhaps missing?
I don't see one in the f2fs_compress_aops, for example.

The other possibiity is that it's a mapping that is missing an ->a_ops.
Is that something f2fs ever does?

I only managed to narrow down the crash to the line:
                return mapping->a_ops->dirty_folio(mapping, folio);
so either mapping->a_ops is NULL or mapping->a_ops->dirty_folio is
NULL.  The reproducer was on ARM and ARM doesn't emit a 'Code:' line,
unlike x86.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
