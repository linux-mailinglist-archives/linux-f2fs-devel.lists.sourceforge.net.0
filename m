Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B086C6D8346
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 18:13:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk5lI-0001OX-SF;
	Wed, 05 Apr 2023 16:13:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pk5lA-0001ON-Ft
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0YGKAhWSIIluAMjfDKpBRI+SxUUkXqNeuXpnbz4DS94=; b=HqtL2Tu2dIAEECK5GTfVo6k7x1
 kY8HF4UHtQV26OQ83F0Tu+gILdDDa6ER93Fh+fjhRayZY/vlBcnciw2VOtWkz3PmycksUOyOgCNMJ
 JggAMj/OUA8FfLE2lKzuxfnrWU4uKUDXnAkBx0jNZx7yMmmwrM91sKNx7Csbx61o5QhU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0YGKAhWSIIluAMjfDKpBRI+SxUUkXqNeuXpnbz4DS94=; b=h7oFUZWviCkIuDujb2rl2RNBkO
 epv0r76vjwz9EJ5UWqAtUOTcH27ic3kXbUQi2Mcal5tPyBl+GtFz8BHGF2qRrvFVRN83B7B03B4RD
 DB9oB8i1YVEe4nQYLYcHWLzD9VGmvuG8UCip29VuksIzzoTsPTJIq1CyiVCY+Y1+qbbw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk5l9-00G8A3-3p for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:13:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CFAA63E77;
 Wed,  5 Apr 2023 16:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90945C433EF;
 Wed,  5 Apr 2023 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680711192;
 bh=BgZ2eR1AMfTLT7IXUy09mn13VpKwlChWuOugjbAL2Ew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MCQhPEA/ROBdA0GMysw8V4w4TC9dPizo+YVsyMAMp2/lEiKL611OTOfrQYtTfCRzb
 slUv1YM0F+UkaLhyS5vcyZameDhAmRyc/ln3ZwRT0l+t16BRB8z/RN3aViRQP/3C+V
 ycY+3Me4yyEod6BKC/VoQk6S30yn1QVIke7xFnH6qJAbJo39asjnkxZOfqbgve2y9F
 kGNnJJosk/68kGz+2VhigiIF8/GVXkAI6huZP9PR98le9IG3fYuT+sAu4KkWZ88iY1
 0sCPb9dvVsXrONScmh528MKAltAPeg6ElD3u7s75cpk350FZLZZXYik9yhvtrsemkx
 3cGXdhEP/jVxg==
Date: Wed, 5 Apr 2023 09:13:10 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZC2eFqN+UdhM6Qu9@google.com>
References: <20230330164948.29644-1-frank.li@vivo.com>
 <a6d9887f-1ff0-fd43-85ff-e6fee87bbe84@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6d9887f-1ff0-fd43-85ff-e6fee87bbe84@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/05, Chao Yu wrote: > On 2023/3/31 0:49,
 Yangtao Li wrote:
 > > +#ifdef CONFIG_F2FS_FS_LZ4HC > > + unsigned char level =
 F2FS_I(cc->inode)->i_compress_level; 
 > > if (level) > > len = LZ4_compress_ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk5l9-00G8A3-3p
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: merge lz4hc_compress_pages() to
 lz4_compress_pages()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/05, Chao Yu wrote:
> On 2023/3/31 0:49, Yangtao Li wrote:
> > +#ifdef CONFIG_F2FS_FS_LZ4HC
> > +	unsigned char level = F2FS_I(cc->inode)->i_compress_level;
> >   	if (level)
> >   		len = LZ4_compress_HC(cc->rbuf, cc->cbuf->cdata, cc->rlen,
> >   					cc->clen, level, cc->private);
> >   	else
> 
> [snip]
> 
> >   #endif
> 
> [snip]
> 
> > +		len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
> 
> It's weired that whole else xxx; statement is split by #endif.
> 
> What about?
> 
> 	unsigned char level = 0;
> 
> #if
> ...
> #endif
> 	if (!level)
> 		len = LZ4_compress_default()

I modified like this.

--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -266,17 +266,19 @@ static void lz4_destroy_compress_ctx(struct compress_ctx *cc)

 static int lz4_compress_pages(struct compress_ctx *cc)
 {
-       int len;
-#ifdef CONFIG_F2FS_FS_LZ4HC
+       int len = -EINVAL;
        unsigned char level = F2FS_I(cc->inode)->i_compress_level;

-       if (level)
+       if (!level)
+               len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
+                                               cc->clen, cc->private);
+#ifdef CONFIG_F2FS_FS_LZ4HC
+       else
                len = LZ4_compress_HC(cc->rbuf, cc->cbuf->cdata, cc->rlen,
                                        cc->clen, level, cc->private);
-       else
 #endif
-               len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
-                                               cc->clen, cc->private);
+       if (len < 0)
+               return len;
        if (!len)
                return -EAGAIN;

> 
> Thanks,
> 
> >   						cc->clen, cc->private);
> >   	if (!len)
> >   		return -EAGAIN;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
