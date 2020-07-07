Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 918342175F2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jul 2020 20:09:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jss1p-00089c-3U; Tue, 07 Jul 2020 18:09:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jss1j-00089L-Du
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 18:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Q1VTZ4rp+/mA1dQ385M9WWX4yZQ0+d88IslrtxE41Y=; b=HQPctIMWiRI/WmDv7LTRQqDhON
 gTUplmP39UeLgbjRCLZ7B359OqmfeIEgVFEFSDf++XmGd6iNImZR34uB/5862PaunAPk+F0P5UU8+
 wVEPSaQSJci3liGfAK4REzFrm1O938jmVck9f/nV9IGfQA5nKCzhbZdCODbVx6A35bRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Q1VTZ4rp+/mA1dQ385M9WWX4yZQ0+d88IslrtxE41Y=; b=Ql+D20Em728Ve8CCgjR3WQBB1y
 j9DoL2vkgc/uhp0SaqIx/Zru8fdvbBI8F+OTJOOUpG8STmGPD/Ai8uoC1x9ycsRIahWPTZgvJQ17B
 1mOo8EYQE6EqGwr4XAFNQLkTzxW0jnDepy1Z9GbRrZ24vwg4iBlSI3gbaAyVrcXJatkg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jss1h-00DRgk-DB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 18:09:07 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8917E20708;
 Tue,  7 Jul 2020 18:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594145335;
 bh=296k3vE2kk+jFGLHJR3rGPowqbR7vIAKHN05TDFqEjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tcnxsJRqHw+W02Km31hpUvdQQVBZ3J18CWf6ryCBIr/V+IM1gdxhjl3eLzTZYSMgT
 MvODHFpSVX+Wwb0vQtNnfA2DuOghtogMd7IjxrhhrEH+I5FZjHbwJAAoDzTOcPraB2
 h8r2enGEWKOpHzfobdAqJ29kADsewKrXCBoz5j9w=
Date: Tue, 7 Jul 2020 11:08:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>
Message-ID: <20200707180854.GB839@sol.localdomain>
References: <20200702015607.1215430-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702015607.1215430-1-satyat@google.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jss1h-00DRgk-DB
Subject: Re: [f2fs-dev] [PATCH v4 0/4] Inline Encryption Support for fscrypt
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 02, 2020 at 01:56:03AM +0000, Satya Tangirala wrote:
> This patch series adds support for Inline Encryption to fscrypt, f2fs
> and ext4. It builds on the inline encryption support now present in
> the block layer, and has been rebased on v5.8-rc3. Note that Patches 1 and
> 2 can be applied independently of Patches 3 and 4 (and Patches 3 and 4 can
> be applied independently of each other).
> 
> This patch series previously went though a number of iterations as part
> of the "Inline Encryption Support" patchset (last version was v13:
> https://lkml.kernel.org/r/20200514003727.69001-1-satyat@google.com).
> 
> Patch 1 introduces the SB_INLINECRYPT sb options, which filesystems
> should set if they want to use blk-crypto for file content en/decryption.
> 
> Patch 2 adds inline encryption support to fscrypt. To use inline
> encryption with fscrypt, the filesystem must set the above mentioned
> SB_INLINECRYPT sb option. When this option is set, the contents of
> encrypted files will be en/decrypted using blk-crypto.
> 
> Patches 3 and 4 wire up f2fs and ext4 respectively to fscrypt support for
> inline encryption, and e.g ensure that bios are submitted with blocks
> that not only are contiguous, but also have continuous DUNs.

I've applied patches 1-3 to fscrypt.git#master for 5.9.
Any additional reviews are still appreciated though.

Ted and Andreas, can I get your Acked-by on patch 4?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
