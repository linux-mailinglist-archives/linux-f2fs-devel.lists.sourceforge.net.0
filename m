Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41506B1FB43
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 19:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8odf9t9Aj9C3k/QoWw6Y5WU2o8YoLVkGWUh5vww8VDU=; b=CjEZce5VkIrYVw+SxoIgTe9kcx
	uhRWZKbTB8aMg8fJ0iyp/gESVi7q80OL1d0lvFBHiZJlJpAgLEKq2xvFV49BhUmdhUJA+aTcMGZ1R
	2VTiCZbpEdh+2MbZoLDf8ckGhk8Xw0Cs0EIHuE9Ab+lt1PgzuN7LfOMtQZnwitCt+jiY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul9T3-00019F-7Y;
	Sun, 10 Aug 2025 17:04:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul9T2-000196-3P
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 17:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WySOGd86XVWxD6xo6PoNBFSH0Hq/h7RzfJ+HTjBKH6A=; b=Jnp81ARRAZJLTDmkWxMUfXoxB9
 DW8Z/bggvaJc15IGG96RxWvsPZgLJvhFTqEmI6WF4NCv7h3KcPERk9iRhCVHuuJhSK7R00vWTOBln
 FRX6DXIzD11TNRmcM4/yRNdmTEok8qYbFdbBEOv5HyR15gCCtOflXTOz1Ab1BSzA+POQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WySOGd86XVWxD6xo6PoNBFSH0Hq/h7RzfJ+HTjBKH6A=; b=VjtaUqHe/Fqqn1242mrjZw1v3L
 JQUQSSFV+lYAD5ONC8jF0qRFWSehgsN0BmUjoct70vyeNda30w7c2Z43AAdHTNQ5Qg3KyHvBnTBP8
 A3YdAiKVd2QxpN0wy2enyjgX0FtJIHEcupDRUL3wkQlAK4O5fzFBAzUZuEhTf1qoaZDw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul9T1-0000wi-Cu for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 17:04:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDA7C5C51AF;
 Sun, 10 Aug 2025 17:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06ABEC4CEEB;
 Sun, 10 Aug 2025 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754845453;
 bh=l/uwp8+24CVqEsn0AO41goH1z3i635SaZlXXxdZB1m4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lvwpxrn05X5vVxj2CwSUJggUKu/MXlIfsJ1YL8pUQPyH1Js1vt6w25He09c/W/JiC
 h+W51s4gSsvNpO1n1TwIFDFT0UcCDuf5zVTPpVm90q5OXa1VlNuIPbevZslMzyPXDX
 ewJ3ef7Bi6CWhm7i5FSalAk6+Fxy8Zb9ms0i1AiaXlsxbZzTljMyUSgSixh+Y+8eY6
 xP8VQi3luA1TtnpsLp9bw9ghQk0Y66bq5hzXoSWT+iGZW23XBLVpgIx+Q6A5cXAhNa
 maPWcdcWL+zA/wkC5mrM1qJp7RF0xKZmrSIpHYHDqK0fe+LN6Aa94WfM/zHpLyGo8g
 tivtq3woYdFZg==
Date: Sun, 10 Aug 2025 10:03:11 -0700
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20250810170311.GA16624@sol>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <aJixkUfWPo5t8Ron@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJixkUfWPo5t8Ron@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 10, 2025 at 07:49:53AM -0700, Christoph Hellwig
 wrote: > On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote: >
 > This is a cleaned-up implementation of moving the i_crypt_info an [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ul9T1-0000wi-Cu
Subject: Re: [f2fs-dev] [PATCH v5 00/13] Move fscrypt and fsverity info out
 of struct inode
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 10, 2025 at 07:49:53AM -0700, Christoph Hellwig wrote:
> On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> > This is a cleaned-up implementation of moving the i_crypt_info and
> > i_verity_info pointers out of 'struct inode' and into the fs-specific
> > part of the inode, as proposed previously by Christian at
> > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> 
> I would really much prefer to move fscrypt to use a hash lookup instead
> of bloating all inodes for a each file system supporting it, even if
> very few files on very few file systems are using it.  With the fsverity
> xfs series posted again this is becoming personal :)
> 
> You mentioned you were looking into it but didn't like the rhashtable
> API.  My offer to help with that still stands.

I assume you actually still mean fsverity, not fscrypt.  First, it would
be helpful not to use one solution for fscrypt and a totally different
solution for fsverity, as that would increase the maintenance cost well
beyond that of either solution individually.

Second, the fsverity info can be loaded very frequently.  For example,
curently it's loaded for each 4K data block processed.  Also, there
*are* use cases in which most files on the filesystem have fsverity
enabled.  Not super common, but they exist.

Yes, the rhashtable is technically O(1), but its code is a mess, both
source code and generated code.  Let's look at the x86_64 code generated
by the fs-specific field solution in this patchset:

     a74:   48 8b 47 28             mov    0x28(%rdi),%rax
     a78:   48 8b 80 a8 00 00 00    mov    0xa8(%rax),%rax
     a7f:   48 8b 00                mov    (%rax),%rax
     a82:   48 8b 04 07             mov    (%rdi,%rax,1),%rax

A few dependent loads, but nice and simple.

Now let's look at the rhashtable version of the load.  (I used the
'struct inode *' as the rhashtable key):

    ffffffff81487f00 <fsverity_get_info>:
    ffffffff81487f00:	f3 0f 1e fa          	endbr64
    ffffffff81487f04:	55                   	push   %rbp
    ffffffff81487f05:	48 89 e5             	mov    %rsp,%rbp
    ffffffff81487f08:	41 57                	push   %r15
    ffffffff81487f0a:	41 56                	push   %r14
    ffffffff81487f0c:	41 55                	push   %r13
    ffffffff81487f0e:	41 54                	push   %r12
    ffffffff81487f10:	53                   	push   %rbx
    ffffffff81487f11:	48 83 ec 10          	sub    $0x10,%rsp
    ffffffff81487f15:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    ffffffff81487f19:	e8 d2 c6 e9 ff       	call   ffffffff813245f0 <__rcu_read_lock>
    ffffffff81487f1e:	48 8b 1d 5b 15 c9 00 	mov    0xc9155b(%rip),%rbx        # ffffffff82119480 <fsverity_info_hashtable>
    ffffffff81487f25:	8b 43 08             	mov    0x8(%rbx),%eax
    ffffffff81487f28:	8b 55 d4             	mov    -0x2c(%rbp),%edx
    ffffffff81487f2b:	8b 4d d0             	mov    -0x30(%rbp),%ecx
    ffffffff81487f2e:	8b 3b                	mov    (%rbx),%edi
    ffffffff81487f30:	2d 09 41 52 21       	sub    $0x21524109,%eax
    ffffffff81487f35:	01 c2                	add    %eax,%edx
    ffffffff81487f37:	01 c1                	add    %eax,%ecx
    ffffffff81487f39:	89 d6                	mov    %edx,%esi
    ffffffff81487f3b:	31 d0                	xor    %edx,%eax
    ffffffff81487f3d:	c1 c6 0e             	rol    $0xe,%esi
    ffffffff81487f40:	29 f0                	sub    %esi,%eax
    ffffffff81487f42:	89 c6                	mov    %eax,%esi
    ffffffff81487f44:	31 c1                	xor    %eax,%ecx
    ffffffff81487f46:	c1 c6 0b             	rol    $0xb,%esi
    ffffffff81487f49:	29 f1                	sub    %esi,%ecx
    ffffffff81487f4b:	89 ce                	mov    %ecx,%esi
    ffffffff81487f4d:	31 ca                	xor    %ecx,%edx
    ffffffff81487f4f:	c1 ce 07             	ror    $0x7,%esi
    ffffffff81487f52:	29 f2                	sub    %esi,%edx
    ffffffff81487f54:	89 d6                	mov    %edx,%esi
    ffffffff81487f56:	31 d0                	xor    %edx,%eax
    ffffffff81487f58:	c1 c6 10             	rol    $0x10,%esi
    ffffffff81487f5b:	29 f0                	sub    %esi,%eax
    ffffffff81487f5d:	89 c6                	mov    %eax,%esi
    ffffffff81487f5f:	31 c1                	xor    %eax,%ecx
    ffffffff81487f61:	c1 c6 04             	rol    $0x4,%esi
    ffffffff81487f64:	29 f1                	sub    %esi,%ecx
    ffffffff81487f66:	8d 77 ff             	lea    -0x1(%rdi),%esi
    ffffffff81487f69:	31 ca                	xor    %ecx,%edx
    ffffffff81487f6b:	c1 c1 0e             	rol    $0xe,%ecx
    ffffffff81487f6e:	29 ca                	sub    %ecx,%edx
    ffffffff81487f70:	31 d0                	xor    %edx,%eax
    ffffffff81487f72:	c1 ca 08             	ror    $0x8,%edx
    ffffffff81487f75:	29 d0                	sub    %edx,%eax
    ffffffff81487f77:	21 c6                	and    %eax,%esi
    ffffffff81487f79:	8b 43 04             	mov    0x4(%rbx),%eax
    ffffffff81487f7c:	4c 8d 6c f3 40       	lea    0x40(%rbx,%rsi,8),%r13
    ffffffff81487f81:	85 c0                	test   %eax,%eax
    ffffffff81487f83:	0f 85 8c 00 00 00    	jne    ffffffff81488015 <fsverity_get_info+0x115>
    ffffffff81487f89:	49 8b 4d 00          	mov    0x0(%r13),%rcx
    ffffffff81487f8d:	48 83 e1 fe          	and    $0xfffffffffffffffe,%rcx
    ffffffff81487f91:	74 71                	je     ffffffff81488004 <fsverity_get_info+0x104>
    ffffffff81487f93:	0f b7 05 f8 14 c9 00 	movzwl 0xc914f8(%rip),%eax        # ffffffff82119492 <fsverity_info_hashtable+0x12>
    ffffffff81487f9a:	44 0f b7 25 f2 14 c9 	movzwl 0xc914f2(%rip),%r12d        # ffffffff82119494 <fsverity_info_hashtable+0x14>
    ffffffff81487fa1:	00 
    ffffffff81487fa2:	49 89 ce             	mov    %rcx,%r14
    ffffffff81487fa5:	44 0f b7 3d e9 14 c9 	movzwl 0xc914e9(%rip),%r15d        # ffffffff82119496 <fsverity_info_hashtable+0x16>
    ffffffff81487fac:	00 
    ffffffff81487fad:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    ffffffff81487fb1:	4d 29 fc             	sub    %r15,%r12
    ffffffff81487fb4:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    ffffffff81487fb8:	4b 8d 3c 26          	lea    (%r14,%r12,1),%rdi
    ffffffff81487fbc:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
    ffffffff81487fc0:	e8 2b 53 4b 00       	call   ffffffff8193d2f0 <memcmp>
    ffffffff81487fc5:	85 c0                	test   %eax,%eax
    ffffffff81487fc7:	75 26                	jne    ffffffff81487fef <fsverity_get_info+0xef>
    ffffffff81487fc9:	4d 85 f6             	test   %r14,%r14
    ffffffff81487fcc:	74 43                	je     ffffffff81488011 <fsverity_get_info+0x111>
    ffffffff81487fce:	4c 89 f3             	mov    %r14,%rbx
    ffffffff81487fd1:	4c 29 fb             	sub    %r15,%rbx
    ffffffff81487fd4:	e8 67 18 ea ff       	call   ffffffff81329840 <__rcu_read_unlock>
    ffffffff81487fd9:	48 89 d8             	mov    %rbx,%rax
    ffffffff81487fdc:	48 83 c4 10          	add    $0x10,%rsp
    ffffffff81487fe0:	5b                   	pop    %rbx
    ffffffff81487fe1:	41 5c                	pop    %r12
    ffffffff81487fe3:	41 5d                	pop    %r13
    ffffffff81487fe5:	41 5e                	pop    %r14
    ffffffff81487fe7:	41 5f                	pop    %r15
    ffffffff81487fe9:	5d                   	pop    %rbp
    ffffffff81487fea:	e9 01 53 4d 00       	jmp    ffffffff8195d2f0 <__pi___x86_return_thunk>
    ffffffff81487fef:	4d 8b 36             	mov    (%r14),%r14
    ffffffff81487ff2:	41 f6 c6 01          	test   $0x1,%r14b
    ffffffff81487ff6:	74 bc                	je     ffffffff81487fb4 <fsverity_get_info+0xb4>
    ffffffff81487ff8:	4c 89 e8             	mov    %r13,%rax
    ffffffff81487ffb:	48 83 c8 01          	or     $0x1,%rax
    ffffffff81487fff:	49 39 c6             	cmp    %rax,%r14
    ffffffff81488002:	75 85                	jne    ffffffff81487f89 <fsverity_get_info+0x89>
    ffffffff81488004:	48 8b 5b 30          	mov    0x30(%rbx),%rbx
    ffffffff81488008:	48 85 db             	test   %rbx,%rbx
    ffffffff8148800b:	0f 85 14 ff ff ff    	jne    ffffffff81487f25 <fsverity_get_info+0x25>
    ffffffff81488011:	31 db                	xor    %ebx,%ebx
    ffffffff81488013:	eb bf                	jmp    ffffffff81487fd4 <fsverity_get_info+0xd4>
    ffffffff81488015:	48 89 df             	mov    %rbx,%rdi
    ffffffff81488018:	e8 33 94 11 00       	call   ffffffff815a1450 <rht_bucket_nested>
    ffffffff8148801d:	49 89 c5             	mov    %rax,%r13
    ffffffff81488020:	e9 64 ff ff ff       	jmp    ffffffff81487f89 <fsverity_get_info+0x89>
    ffffffff81488025:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    ffffffff8148802c:	00 00 00 00 

It doesn't really seem like the kind of solution that's a good choice
for a frequently-loaded field.  And that's only the load; it's not
getting into the insertion (and resizing) part.

Reliability due to the code complexity is also a concern, of course.
'git log --grep="rhashtable:" --grep="Fixes:" --all-match' turns up
quite a few issues in rhashtable over time...

If we're going so far as to use a rhashtable, I have to wonder why we
aren't first prioritizing other fields.  For example ext4_inode_info
unconditionally has 40 bytes for fast_commit information, even though
fast_commit is an experimental ext4 feature that isn't enabled on most
filesystems.  That's 5 times as much as i_verity_info.  And quota has 24
bytes under CONFIG_QUOTA.  And there are even holes in the
ext4_inode_info struct; we could also just improve the field packing!

The fs-specific field solution from this patchset is much more efficient
than the rhashtable: efficient enough that we don't really have to worry
about it, regardless of fscrypt or fsverity.  So I think it's a good
middle ground, and I'd like to just do it this way.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
