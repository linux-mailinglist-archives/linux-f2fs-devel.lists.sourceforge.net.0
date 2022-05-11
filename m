Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DF6523B58
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 19:19:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nopzI-0002rk-Gu; Wed, 11 May 2022 17:18:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nopzG-0002rd-Sk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 17:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=59fPeBgPhFcXO7yKBvKQRSz9AeJWLIfwYzfilOR4Qq0=; b=JBNPse1MX6HIgxiHM/VYeOGVY6
 4Ul33o4wxHMf4S8is2gK5eFvMNHK91a21tEXQ4Ok7jevPruOQyof/rr2oEhhbNpB+JaZYTgSRuUUn
 i7fiNRPTnUCGhwjIvejbJmfe97GoUFhiJloRvNrcy5QJ9UIYacp5Eg+1C/rUCfdkDiHM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=59fPeBgPhFcXO7yKBvKQRSz9AeJWLIfwYzfilOR4Qq0=; b=IoXxW8tqeQTDOMLdOl4KrKA2Dn
 lOz6bu1+nzT8YSLVTukizBEe//3D9pbgeMKTn62aYzQLAQaLc4nvrZ6+xHhWHRqtPXxg5pTObYG/m
 keXFGS5CPSg0nohbNVS5zQdkdy4ibg4QiC7xXbay9q0REHz+hlBCHgVyhwBJzJAjDnU8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nopzB-008yym-I1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 17:18:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F0FA61D25;
 Wed, 11 May 2022 17:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C70C34113;
 Wed, 11 May 2022 17:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652289522;
 bh=dtt51r4FC8J4L/dpuNqjEYl6pzvtBwAn3jhFVusBWWw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oUnj8zqjKAopFQqGYTk6FFowSyKG3lS3+ydTHHjwyq4HNTs2ZQJbRQFPx0h4nd+bl
 CJYZTaaZlX7RDk429hT8CNfZScyz5nSuCBthURoMGDlmbuZ1lb1CsHLkbdI4KeZTjE
 V4qWjRLFEh/TlecDQBqAajV96TTQbdp0lFmOgmhOOqVjm45zaQAnqwH5w/mPrNlQXc
 VnaZvm2KAng84KRhZOe8+00Crxf6AUXV2HeEzmaJgNasZN3w7/XuZ8w1rLHa2XBAXt
 o9tcnG40Obo/u8VsWAWg7oYdJjwzYnBqjjkETjdt5IenTFj0FDRmM4N8ajvcpTf/ZI
 jyFKAMn2NBHow==
Date: Wed, 11 May 2022 17:18:34 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Message-ID: <Ynvv6nf5rWmKItSL@gmail.com>
References: <20220501050857.538984-1-ebiggers@kernel.org>
 <20220501050857.538984-2-ebiggers@kernel.org>
 <20220511125023.gxfkgft35gkjyhef@riteshh-domain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511125023.gxfkgft35gkjyhef@riteshh-domain>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 06:20:23PM +0530,
 Ritesh Harjani wrote:
 > > +static int ext4_check_test_dummy_encryption(const struct fs_context
 *fc, > > + struct super_block *sb) > > Maybe the function name [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nopzB-008yym-I1
Subject: Re: [f2fs-dev] [PATCH v2 1/7] ext4: only allow
 test_dummy_encryption when supported
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Lukas Czerner <lczerner@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 11, 2022 at 06:20:23PM +0530, Ritesh Harjani wrote:
> > +static int ext4_check_test_dummy_encryption(const struct fs_context *fc,
> > +					    struct super_block *sb)
> 
> Maybe the function name should match with other option checking, like
> ext4_check_test_dummy_encryption_consistency() similar to
> ext4_check_quota_consistency(). This makes it clear that both are residents of
> ext4_check_opt_consistency()
> 
> One can argue it makes the function name quite long. So I don't have hard
> objections anyways.
> 
> So either ways, feel free to add -
> 
> Reviewed-by: Ritesh Harjani <ritesh.list@gmail.com>

I did consider that, but that name seemed too long, as you mentioned.

Thanks for the review!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
