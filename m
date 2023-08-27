Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C508478A191
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Aug 2023 22:47:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaMfg-0004JO-Hc;
	Sun, 27 Aug 2023 20:47:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1qaMfe-0004JF-Ln
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 20:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PcFOPVpAmfEy32wmLZk8ueqNLvTCgnNwnqcJznT/RPQ=; b=cg9KXFkDjBUoGifonyfF9qpG7A
 Fvhkw/3CZYCAoveTeshtfb/CNA6c7Dq//l5PzD7+YnXzd819hH1h2LSFWf8F8SFZVLQ8Rk1Sd/bJX
 HE9rRmFYhs/Zxf/4oeKRP0RuvfQYMF6Uvu6A7lwu7ee2AZeFoji23WnKSyrphYa/6EHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PcFOPVpAmfEy32wmLZk8ueqNLvTCgnNwnqcJznT/RPQ=; b=XxErIVFGlw752fwTKCMm1pE0dp
 1itW+gDdk7wIeSkLUHp5u+P7+wp2i6F3Dw3PfZDwM2MXfjjCsov1Ld15ON3zzqWwWlSpu1hhuBdnX
 iOqXrxRCWmpAkhQ0/quZGmjwQaEv7Z/JHaN83tx/FyvjSHtkbwOtapvYZtKMuz/Ozizk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaMfa-0003ZS-R4 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 20:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PcFOPVpAmfEy32wmLZk8ueqNLvTCgnNwnqcJznT/RPQ=; b=rNsimzjbKmM2oAlOTJ0DzjsqcD
 17aYtuzwaGU+CR8bJtkEeJr/wCSQMKchDc0n2mlQZ7v9rEEKKGacwZsk+Mho4BlGQdRHWhRckPvPs
 fMAYQy7+QXBdTjAznfYn8yoo2Vt8NnBgsp0KpbdkC6EeIBdGLqHsafJ8s67fpw63Doi4IWtOlBji1
 MNTrBEfgnOFbk2WLamTkOgHWwWl/muBmiqb1Xzl2D+NHqIQ82dzKbnLLfmjRYZ7IV0n24RJ6z3j9d
 dk+Bi80MVVBrmB0+FFfEqYIN7sGr6Bu4FSHMLVu2SkHeyRuhO+l5+YcAQVjuGi14l8MuPMLDNTwlB
 D4MIXbrw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qaMf3-00DklQ-NN; Sun, 27 Aug 2023 20:47:05 +0000
Date: Sun, 27 Aug 2023 21:47:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOu2SbpbRtQPeaDk@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-5-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827132835.1373581-5-hao.xu@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 27, 2023 at 09:28:28PM +0800, Hao Xu wrote: >
 +++ b/include/linux/file.h > @@ -81, 6 +81,
 8 @@ static inline void fdput_pos(struct
 fd f) > fdput(f); > } > > +extern int file_pos_lock_nowait( [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qaMfa-0003ZS-R4
Subject: Re: [f2fs-dev] [PATCH 04/11] vfs: add a vfs helper for io_uring
 file pos lock
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 27, 2023 at 09:28:28PM +0800, Hao Xu wrote:
> +++ b/include/linux/file.h
> @@ -81,6 +81,8 @@ static inline void fdput_pos(struct fd f)
>  	fdput(f);
>  }
>  
> +extern int file_pos_lock_nowait(struct file *file, bool nowait);

No extern on function declarations.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
