Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7764145EF0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jan 2020 00:07:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iuP5V-0008OP-VP; Wed, 22 Jan 2020 23:07:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iuP5U-0008OB-NQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jan 2020 23:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nukPsxWLLzQ1KeasqoNBdJ+Ht4Ckwhu8wdfENE7E+lY=; b=cCF6d0kjCnCGEL3xaOumQKsZzl
 BMu5bQEJLlannKVGN1B5cnNLWUfXHRjGOJjI/RkRMbauoRqFyL3MvW8blgy3RR94OFaH4DhrRkoMy
 /yR//+WbEhFmHb0GFoMpd+uCiizfX3QHtlztaCN69ISghf60L0c/Q/d4YYx+XljluHQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nukPsxWLLzQ1KeasqoNBdJ+Ht4Ckwhu8wdfENE7E+lY=; b=nD620xvlvQy1ljW50LX4NjzCld
 mKnbnst+skiXHpkaN5UYNKpW98qXQ0V6PGcJYzcU+q9nIdzl+0PhbdXI5S8dtVy5cMbaoOrl8N4Bv
 lk9j696sClox2ONUPzbJ/NIWPmhGNGdkbeWwXKEDy7E4fWAryLyYIhV+I3mPYUPBjr74=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iuP5S-00FBDi-KB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jan 2020 23:07:04 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9A802465A;
 Wed, 22 Jan 2020 23:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579734412;
 bh=iDK9mhfatk0/hNugU/WPUPfmhu1Thz7bh75Z2DXYU/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MdMedgKfSUinhQoW7EX8dAKvj1YwqwHzlbb1cbzLT6dOt2HZWykDyFD3k2cNyhQyK
 8GB5uINMlhWRPvQRr20QS8SxKPsazWkqZ9NELkASmhvpjUozkcfUA+LLJ+HQqgq/Lb
 YogycmIn0nDOqv8LkTPXOOSGVMsOMS5102vK6M3Q=
Date: Wed, 22 Jan 2020 15:06:50 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200122230649.GC182745@gmail.com>
References: <20200120223201.241390-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120223201.241390-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iuP5S-00FBDi-KB
Subject: Re: [f2fs-dev] [PATCH v5 0/6] fscrypt preparations for
 encryption+casefolding
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
Cc: Daniel Rosenberg <drosen@google.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 20, 2020 at 02:31:55PM -0800, Eric Biggers wrote:
> This is a cleaned up and fixed version of the fscrypt patches to prepare
> for directories that are both encrypted and casefolded.
> 
> Patches 1-3 start deriving a SipHash key for the new dirhash method that
> will be used by encrypted+casefolded directories.  To avoid unnecessary
> overhead, we only do this if the directory is actually casefolded.
> 
> Patch 4 fixes a bug in UBIFS where it didn't gracefully handle invalid
> hash values in fscrypt no-key names.  This is an existing bug, but the
> new fscrypt no-key name format (patch 6) made it much easier to trigger;
> it started being hit by 'kvm-xfstests -c ubifs -g encrypt'.
> 
> Patch 5 updates UBIFS to make it ready for the new fscrypt no-key name
> format that always includes the dirhash.
> 
> Patch 6 modifies the fscrypt no-key names to always include the dirhash,
> since with the new dirhash method the dirhash will no longer be
> computable from the ciphertext filename without the key.  It also fixes
> a longstanding issue where there could be collisions in the no-key
> names, due to not using a proper cryptographic hash to abbreviate names.
> 
> For more information see the main patch series, which includes the
> filesystem-specific changes:
> https://lkml.kernel.org/linux-fscrypt/20200117214246.235591-1-drosen@google.com/T/#u
> 
> This applies to fscrypt.git#master.
> 
> Changed v4 => v5:
>   - Fixed UBIFS encryption to work with the new no-key name format.

I've applied this series to fscrypt.git#master; however I'd still like Acked-bys
from the UBIFS maintainers on the two UBIFS patches, as well as more
Reviewed-bys from anyone interested.  If I don't hear anything from anyone, I
might drop these to give more time, especially if there isn't an v5.5-rc8.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
