Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA556B326E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Mar 2023 00:55:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1paQ6H-0000D4-0h;
	Thu, 09 Mar 2023 23:55:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1paQ6C-0000Cx-Q0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Mar 2023 23:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IAqxC3wUP2EYGVo7XR8MA/kc1dctNij0ARPsGHn0FTM=; b=R2cx9xz12b5A+hKL6ZpVNe+ok8
 EG+F5PfIf7M+eQ4CEhCunL8RwzTQS/LIKszCrJx53y+cHeZbdb+PMbbDBPb1ZS6sK4G7rWdSyaY+a
 Jj0b8nqrvRGKUzJ4CEENgH/B+JXdhJXGzq/8RLlt53jkO1Jpmu2WnPcGnzW3SzMfnaMs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IAqxC3wUP2EYGVo7XR8MA/kc1dctNij0ARPsGHn0FTM=; b=O7Yov7AsabpNCla79OK1hYZu8a
 aYW8gnQxkBV1qusYv9y34V06aXftxghbxjfKpy+gPsporn8EEaYTZg5oK7lYUtzTfL2GIpTrQD4Nb
 mzKOPA2ZQBSZEjXP5DOtI4XNY3pVtyw/fWV0ZfE1K909DpRlRMNcdTjPVeXJHU1ONu6c=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1paQ6C-00039H-2z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Mar 2023 23:55:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7B266B82126;
 Thu,  9 Mar 2023 23:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B879C433EF;
 Thu,  9 Mar 2023 23:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678406093;
 bh=NVI2OlJ900G4SGtLDQtVSYp/i7Iky39BU/S4ql+hYwc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hn5jbEneu117NrVW3NwCd1ZDLW+pw4VrpIEutwIq2nYwpnuf+CM/KuonptYSnp8wP
 WA0o6VlL1aWQMsFe6V+4BugCw2h1Vq2Csr+OhNpN04jITeuJbIEOQIInYuzXIlsDMx
 +QZLVeScEdSjyA3+/htoEKcE7excUib6hay0574yCYfQBJC916HOT5S+J1y7KC4GRq
 n5MEPh4Uf6qKw9RYySUxMb2ImjAMtCi0LQQdqG/F4Z0LgtqkoS48fN/qTwnOIqHLcH
 LxaRI2gvbakexrA3KUDNmA6t7iXYCK6X/yFW4o7zdy/beWZvPLXrkKk05OE3T22uAk
 DsoX4CGJ6+ibA==
Date: Thu, 9 Mar 2023 15:54:51 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: David Laight <David.Laight@aculab.com>
Message-ID: <ZApxy2u9j3yKFRyS@google.com>
References: <20230307151408.58490-1-chao@kernel.org>
 <942fe8111fdb48e583b846f3e2902228@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <942fe8111fdb48e583b846f3e2902228@AcuMS.aculab.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/08,
 David Laight wrote: > From: Chao Yu <chao@kernel.org>
 > > Sent: 07 March 2023 15:14 > > > > F2FS-fs (dm-x): inconsistent rbtree,
 cur(3470333575168) next(3320009719808) > > [ cut [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1paQ6C-00039H-2z
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix unaligned field offset in 32-bits
 platform
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
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/08, David Laight wrote:
> From: Chao Yu <chao@kernel.org>
> > Sent: 07 March 2023 15:14
> > 
> > F2FS-fs (dm-x): inconsistent rbtree, cur(3470333575168) next(3320009719808)
> > ------------[ cut here ]------------
> > kernel BUG at fs/f2fs/gc.c:602!
> > Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> > PC is at get_victim_by_default+0x13c0/0x1498
> > LR is at f2fs_check_rb_tree_consistence+0xc4/0xd4
> > ....
> > [<c04d98b0>] (get_victim_by_default) from [<c04d4f44>] (f2fs_gc+0x220/0x6cc)
> > [<c04d4f44>] (f2fs_gc) from [<c04d4780>] (gc_thread_func+0x2ac/0x708)
> > [<c04d4780>] (gc_thread_func) from [<c015c774>] (kthread+0x1a8/0x1b4)
> > [<c015c774>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> > 
> > The reason is there is __packed attribute in struct rb_entry, but there
> > is no __packed attribute in struct victim_entry, so wrong offset of key
> > field will be parsed in struct rb_entry in f2fs_check_rb_tree_consistence,
> > it describes memory layouts of struct rb_entry and struct victim_entry in
> > 32-bits platform as below:
> > 
> > struct rb_entry {
> >    [0] struct rb_node rb_node;
> >        union {
> >            struct {...};
> >   [12]     unsigned long long key;
> >        } __packed;
> 
> This __packed removes the 4-byte pad before the union.
> I bet it should be removed...

struct rb_node {
        unsigned long  __rb_parent_color;
        struct rb_node *rb_right;
        struct rb_node *rb_left;
} __attribute__((aligned(sizeof(long))));

Hmm, isn't this aligned to 32bits originally? Why does 32bits pad 4-bytes
if we remove __packed?

> 
> > }
> > size of struct rb_entry: 20
> > 
> > struct victim_entry {
> >    [0] struct rb_node rb_node;
> >        union {
> >            struct {...};
> >   [16]     struct victim_info vi;
> >        };
> >   [32] struct list_head list;
> > }
> > size of struct victim_entry: 40
> > 
> > This patch tries to add __packed attribute in below structure:
> > - discard_info, discard_cmd
> > - extent_info, extent_node
> > - victim_info, victim_entry
> > in order to fix this unaligned field offset issue in 32-bits platform.
> 
> Have you looked at the amount of extra code that gets generated
> on systems that fault misaligned accesses?
> 
> Plausibly adding __packed __aligned(4) will restrict the compiler
> to just aligning 64bit items on 32bit boundaries.
> But even then is you pass the address of a misaligned structure
> to another function it will fault later of.
> 
> You haven't actually said where the misalignment comes from.
> If the code is doing (foo *)(ptr + 1) then that is broken
> when the alignments of 'ptr' and 'foo' differ.

IIUC, the problem comes since we access the same object with two structures
to handle rb_tree.

E.g.,

[struct extent_node]                   [struct rb_entry]
struct rb_node rb_node;                struct rb_node rb_node;
                                       union {
struct extent_info ei;                   struct {
  unsigned int fofs;                       unsigned int ofs;
  unsigned int len;                        unsigned int len;
                                         };
                                         unsigned long long key;
                                       } __packed;

So, I think if we get a different offset of fofs or ofs between in
extent_node and rb_entry, further work'll access a wrong memory since
we simply cast the object pointer between two.

> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
