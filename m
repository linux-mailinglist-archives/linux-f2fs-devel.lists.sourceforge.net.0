Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F96B528D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Mar 2023 22:08:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pajyr-0000BW-Jk;
	Fri, 10 Mar 2023 21:08:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pajyo-0000BP-Lf
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Mar 2023 21:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xj7mQ+JG3/WaHSeZMZlfSP4EbX88XeVPXvr7P33g2Yg=; b=WHdi6SvIaje15UeJ7b33VC0Fjx
 WLcghE6B1QGr2/oC3I8DQljq3HHq93Ms309b9swXGdWSWg733Re6T0yn3DnHWDPie3+qVLRBV0wgm
 oZIJ9wNP9ZZ+Xxr9ih3SRu4I4VUYclbICszyDLKPZFPC0ZShuelHYBfIYrD1aGqEJjPI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xj7mQ+JG3/WaHSeZMZlfSP4EbX88XeVPXvr7P33g2Yg=; b=O+jA7jOu2IDiFfe+v+C2vHapiA
 2Sc9QxQE0vUR3h0wUY8q9LTLcDXuS5VvSEEHZ+sQRLy3O4/geHdhiubU0a45dIpG9LRy/zNLC3cbo
 UK8r176p5jCNYYH0FrG2LMLCVSK2bktpBeGkBgrnkcoo410dOhmg5oPdjnVE6PTWRWPc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pajyo-003yFt-TX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Mar 2023 21:08:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74EBFB8242A;
 Fri, 10 Mar 2023 21:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1017AC433EF;
 Fri, 10 Mar 2023 21:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678482519;
 bh=FvdKu+vPe6+wxwF73fb2DHyxy+tnqwlUIpWlS/w7S+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BvisITj/zU+5xF57rPkv+LrKYkk16YC+7mWjMLVueLj7MqUgDnRwlmwpZdqxe3+N4
 89D9HIiM5KVQaZ2hHz4yCJEy1bhUnkkFytOV6853eeveH8QLAeIiLJhFtS5Eet2sQW
 ezYufDM68CF3k6/s9lWOvXWIwUuLjfAHdtIXrrBKlUiG79qkkWjf40XH/ChWyw2cze
 TWWGenl7eSQw1mMbNY7aYzdzUr2ncre3QCbrgT1lxbYcXhiooNe85QhOTAGUiVuTWc
 uuAKu82U36tapc/mgP8HRGQV9XWV5GkNAcKo4tON56FyHiU6CU+m+/LW9/OBP+0Y0b
 R8dCgPzwzzGYA==
Date: Fri, 10 Mar 2023 13:08:37 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: David Laight <David.Laight@aculab.com>
Message-ID: <ZAucVdF7N2LVkjCY@google.com>
References: <20230307151408.58490-1-chao@kernel.org>
 <942fe8111fdb48e583b846f3e2902228@AcuMS.aculab.com>
 <ZApxy2u9j3yKFRyS@google.com>
 <362576043b2f4c56a3ea112364d04fcd@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <362576043b2f4c56a3ea112364d04fcd@AcuMS.aculab.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/10, David Laight wrote: > From: Jaegeuk Kim > > Sent:
 09 March 2023 23:55 > > > > On 03/08, David Laight wrote: > > > From: Chao
 Yu <chao@kernel.org> > > > > Sent: 07 March 2023 15:14 > > > > > [...] 
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
X-Headers-End: 1pajyo-003yFt-TX
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

On 03/10, David Laight wrote:
> From: Jaegeuk Kim
> > Sent: 09 March 2023 23:55
> > 
> > On 03/08, David Laight wrote:
> > > From: Chao Yu <chao@kernel.org>
> > > > Sent: 07 March 2023 15:14
> > > >
> > > > F2FS-fs (dm-x): inconsistent rbtree, cur(3470333575168) next(3320009719808)
> > > > ------------[ cut here ]------------
> > > > kernel BUG at fs/f2fs/gc.c:602!
> > > > Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> > > > PC is at get_victim_by_default+0x13c0/0x1498
> > > > LR is at f2fs_check_rb_tree_consistence+0xc4/0xd4
> > > > ....
> > > > [<c04d98b0>] (get_victim_by_default) from [<c04d4f44>] (f2fs_gc+0x220/0x6cc)
> > > > [<c04d4f44>] (f2fs_gc) from [<c04d4780>] (gc_thread_func+0x2ac/0x708)
> > > > [<c04d4780>] (gc_thread_func) from [<c015c774>] (kthread+0x1a8/0x1b4)
> > > > [<c015c774>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> > > >
> > > > The reason is there is __packed attribute in struct rb_entry, but there
> > > > is no __packed attribute in struct victim_entry, so wrong offset of key
> > > > field will be parsed in struct rb_entry in f2fs_check_rb_tree_consistence,
> > > > it describes memory layouts of struct rb_entry and struct victim_entry in
> > > > 32-bits platform as below:
> > > >
> > > > struct rb_entry {
> > > >    [0] struct rb_node rb_node;
> > > >        union {
> > > >            struct {...};
> > > >   [12]     unsigned long long key;
> > > >        } __packed;
> > >
> > > This __packed removes the 4-byte pad before the union.
> > > I bet it should be removed...
> > 
> > struct rb_node {
> >         unsigned long  __rb_parent_color;
> >         struct rb_node *rb_right;
> >         struct rb_node *rb_left;
> > } __attribute__((aligned(sizeof(long))));
> > 
> > Hmm, isn't this aligned to 32bits originally? Why does 32bits pad 4-bytes
> > if we remove __packed?
> 
> That attribute is entirely pointless.
> IIRC It is a request to increase the alignment to that of long.
> It wouldn't have any effect even if 'packed' was also specified.
> (Unless you are building for 64-bit windows.)
> 
> The 'issue' is that on arm32 (unlike x86) 'long long' has
> 64bit alignment.
> So without the __packed on the union there is a 4 byte hole
> before the union.
> 
> ...
> > IIUC, the problem comes since we access the same object with two structures
> > to handle rb_tree.
> > 
> > E.g.,
> > 
> > [struct extent_node]                   [struct rb_entry]
> > struct rb_node rb_node;                struct rb_node rb_node;
> >                                        union {
> > struct extent_info ei;                   struct {
> >   unsigned int fofs;                       unsigned int ofs;
> >   unsigned int len;                        unsigned int len;
> >                                          };
> >                                          unsigned long long key;
> >                                        } __packed;
> > 
> > So, I think if we get a different offset of fofs or ofs between in
> > extent_node and rb_entry, further work'll access a wrong memory since
> > we simply cast the object pointer between two.
> 
> That example actually happens to work.
> But replace 'unsigned int' with 'long long' and it all fails.
> 
> That is horribly broken (by design).
> You can't do that and expect it to work at all.
> This is another case where you don't want __packed, but to
> request a compilation error if padding was added.
> 
> The safest 'fix' (it is still broken by design) is to change the
> alignment of rb_node to be that of 'long long' and remove the
> __packed from the union.
> That adds a 4 byte pad to rb_node on some, but not all, 32bit
> architectures.
> Then all the code that used the above pattern is (probably) ok.
> 
> You can use (if I've spelt them right) aligned(Alignof(long long))
> but not aligned(__alignof(long long)) because the latter returns
> the preferred alignment not the actual alignment (8 not 4 on x86).
> I think Alignof() is ok for current kernels, but not for anything
> that might get backported to stable.
> You can use __alignof(struct {long long x;}).
> 
> Actually this should also work:
> struct rb_node {
>     union {
>         long long alignment;
>         struct {
>             unsigned long  __rb_parent_color;
>             struct rb_node *rb_right;
>             struct rb_node *rb_left;
>         }
>     }
> };

Thank you for the explanation. IMHO, it'd be good to keep the existing rb_node
for all the other components, but a problem of wrong design in f2fs.

I posted three patches to remove this buggy rb_entry sharing.
https://lore.kernel.org/lkml/20230310210454.2350881-1-jaegeuk@kernel.org/T/#t

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
