Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AB283B7AA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 04:14:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSqBt-0006ZP-Sr;
	Thu, 25 Jan 2024 03:14:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rSqBp-0006Z7-P2
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 03:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=paUTc/9FphzBCnZcrDM9ZvQCJpksDKQ6ilRoRSSSBGs=; b=gMWZ8IzdtYQK3QswGGjRCm6lvL
 +J/FJUjdzhHITsp0lohgaCPzuIOIEpgmLqfKANcKzWXZqmOepPV/86OCkuSGBqjz9g2TJF8GntPG/
 wLYaqNvHDhNZf4V0sKhlsHKXlEvGcvmmUvW2AjkPalrmpNE81uAqVD5mksyY7+RhgP/I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=paUTc/9FphzBCnZcrDM9ZvQCJpksDKQ6ilRoRSSSBGs=; b=R4C9xaJ7JqmC5TstY69HguuAts
 vHAeKwajMrWBMQcLffmiFAhzYSTP8vqMQQuAsx2b4itxqQaHCFLnF9cLdvVsJjHJYV2MokEqtS9ML
 0+LVKUkM7pPjo1aWE5I9MzSRzs9u0PZq2qcsjGSxxqvmVyyzolzHSScd3HEFeE3Q7M4k=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSqBn-0005v6-Mi for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 03:14:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AA765CE32B9;
 Thu, 25 Jan 2024 03:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF53C433F1;
 Thu, 25 Jan 2024 03:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706152430;
 bh=paUTc/9FphzBCnZcrDM9ZvQCJpksDKQ6ilRoRSSSBGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jqJ93DjMTJySl66BliexsxEn/cZmYh2Sq/3oICmTkLpcuXAwNpUL8rx47nSZpqWZz
 nMH32OKwLGL9JMNLOIbefpSxDitfEGGAGEP5KiiYGSXkoKJiqv1uubsLTXSdclSXVk
 08PswQwrmp+VCmafQ4uqKd0t/9un/Zc/8unK1G5vsmqAV8UoVfNJc87KbXgOer/Vun
 tiHLE4BMUn87epXKgtFO0UczuOWSku2paqYn2nYfhkF5wfNyawWbaxRxrTBOx6gSE2
 UR2llNSua5G19KaITc4yNZxQh02F99Ny1flJtjf4fxqMgDPiSRphNziHQ073LX4WTj
 /pIBoxyct6MtQ==
Date: Wed, 24 Jan 2024 19:13:48 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240125031348.GD52073@sol.localdomain>
References: <20240119184742.31088-1-krisman@suse.de>
 <20240119184742.31088-7-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240119184742.31088-7-krisman@suse.de>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 19, 2024 at 03:47:38PM -0300, Gabriel Krisman
 Bertazi wrote: > +/** > + * generic_set_sb_d_ops - helper for choosing the
 set of > + * filesystem-wide dentry operations for the enabled feat [...]
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rSqBn-0005v6-Mi
Subject: Re: [f2fs-dev] [PATCH v3 06/10] libfs: Add helper to choose dentry
 operations at mount
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
Cc: tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 19, 2024 at 03:47:38PM -0300, Gabriel Krisman Bertazi wrote:
> +/**
> + * generic_set_sb_d_ops - helper for choosing the set of
> + * filesystem-wide dentry operations for the enabled features
> + * @sb: superblock to be configured
> + *
> + * Filesystems supporting casefolding and/or fscrypt can call this
> + * helper at mount-time to configure sb->s_d_root to best set of dentry

s_d_op, not s_d_root.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
