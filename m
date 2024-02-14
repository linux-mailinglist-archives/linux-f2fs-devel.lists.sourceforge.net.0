Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF16B85579B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Feb 2024 00:54:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1raP5H-0004Lp-8l;
	Wed, 14 Feb 2024 23:54:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1raP5E-0004LT-Pi
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Feb 2024 23:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fD+Liot/QopPw+J8SWLX1NF1pMEzg08c+fYf47+/ctw=; b=Wp4Fl4+dEK73NsP6YHi7B+rrLQ
 DkKBR3+oBFn83wcI9JKEAgMVtPB4/EEAPj0cRdoWPwYTaeM9IVkR2dgsHHvCH0NOJq/v1446Fnsbo
 EAbGZqfVZ/pxhz/yXNTQPGPMcVt0L89N0rsRlp3WNUFsLm9z4ZyjgVMoEGhTCvHYJDdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fD+Liot/QopPw+J8SWLX1NF1pMEzg08c+fYf47+/ctw=; b=gswogiOKpYB/kzU3eZyfWNFZG9
 MMBhmpRChV57DZcXDwe/+PysU/JKCo0QL28AwV8ykJC983ZEDxZ3825Bl5MqrSq3mBNtVdYF47/HZ
 FqjwKtseuF7dLFWcmI33eyNjYFMupFp6OwIC5bbmMkxkZW32rtXkbbcJwQvNH9TfIPBA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1raP5A-0005sc-0t for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Feb 2024 23:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0EE41CE2342;
 Wed, 14 Feb 2024 23:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0201CC433C7;
 Wed, 14 Feb 2024 23:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707954861;
 bh=fD+Liot/QopPw+J8SWLX1NF1pMEzg08c+fYf47+/ctw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NYwKIyLmjfx/iNGFuuukgKoIaDIGRgp05j11I/Y/OMzg4vfGzYpR+o2GtOJkJfa68
 yjlhjS0ZShMfa/yFKM2ykpHGDOu8ZiZC/tFAa6AjWUgpNHst6aP0vzNjkBkcAWQP5P
 kagaV6CWhSY2PV5obxunqx65x+BiXvkPALRSzTeq8Rgy6k8oA1I05cKsOX5jmWjqyS
 v8GJDLB7cOBnfCFc8y3vN7So34rbiUVJEGaE4BWGyhyQn617fblfgTO2Y3wgfYjRc6
 P8O/QIsLRDQCVgTs/cO3F5MPEdpvndCQ9xEnGQYBi7rUxV8W0u/y8/SJzNETQG3rdN
 r/+MZuoVb8MgQ==
Date: Wed, 14 Feb 2024 15:54:19 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240214235419.GG1638@sol.localdomain>
References: <20240213021321.1804-1-krisman@suse.de>
 <20240213021321.1804-3-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213021321.1804-3-krisman@suse.de>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 12, 2024 at 09:13:13PM -0500, Gabriel Krisman
 Bertazi wrote: > Both fscrypt_prepare_lookup_dentry_partial and >
 fscrypt_prepare_lookup_dentry
 Neither of these functions exist. - Eric 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1raP5A-0005sc-0t
Subject: Re: [f2fs-dev] [PATCH v6 02/10] fscrypt: Factor out a helper to
 configure the lookup dentry
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
Cc: brauner@kernel.org, tytso@mit.edu, amir73il@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 12, 2024 at 09:13:13PM -0500, Gabriel Krisman Bertazi wrote:
> Both fscrypt_prepare_lookup_dentry_partial and
> fscrypt_prepare_lookup_dentry

Neither of these functions exist.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
