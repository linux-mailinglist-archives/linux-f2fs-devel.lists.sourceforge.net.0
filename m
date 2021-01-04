Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8E2E9715
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Jan 2021 15:21:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwQjR-0004ne-Sb; Mon, 04 Jan 2021 14:21:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kwQjL-0004nF-1S
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jan 2021 14:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cYtmhLrq1nTL5KhZkjg8Ue6/BMDKj8Xzfy6tx37ms20=; b=U8wH5cQwNbTTx0waUBQ3HYt4AR
 uFkWn8upVtjne36x73sZdCtwV4LYqnRpchDPHjO+dFso3sVXxjiRyANhvVpy/84SbfojUp50B3ky2
 jEiYcfyos7jNV7lxk5ObAPUdxGrHu6adIqFsY89aiiLdG8oLccnGTfvXR46Xa4AJDmd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cYtmhLrq1nTL5KhZkjg8Ue6/BMDKj8Xzfy6tx37ms20=; b=HynuJnqgH566IJVWJZUTij338W
 veDXR1WuGvUaAM7y9SU4yTaaXJHIjGCVj8FE0mhPfxpAl+N7LJfxog/dKtb7xlFuwcIujRB4zrib6
 8eEFW258o/rdO+NCskrqBM203WJd151rsqh68r/9mzqOotrTp8J2UrL9fBydwi1n4TBc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwQjB-00C1eJ-2B
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jan 2021 14:21:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51C0D20784;
 Mon,  4 Jan 2021 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609770046;
 bh=cx/RKMatwM2OwlH8Re5yHYBI7WUVFqOnWvP2MtRW//k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V3cf50d1aagCZotHVA4dgXCUvfplv6p4sVhPX/lNJZRn7xQbmygnAB6FqEuHWu0H/
 GL3Y0iI1g9+n/xvf3N9UtEe6Nug2Nw46OOalfV/5lmTZh93EJXmttiSnwIPH8tqElR
 yyoSzPeRy4nIKkcaTzHBPm6cly6gcaYpRjgu+HnO9zr5doEnr8vIS1c5nrqbZk0a/Q
 Pm2hWT1qtw6au4gaV2hJBF9Vbyny2YfPdSzYvyzIg0daWWt81st+1DiDyesFoMfudw
 4tckZ7ZiuyZEvEpF7QYRO3x51oeapjPOgk39HcmjMOJ2xtY6sYAL8iNhxe2W3D7GHZ
 8qf10EUgaYHWg==
Date: Mon, 4 Jan 2021 09:20:44 -0500
From: Sasha Levin <sashal@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210104142044.GA3665355@sasha-vm>
References: <20201230130314.3636961-1-sashal@kernel.org>
 <20201230130314.3636961-10-sashal@kernel.org>
 <X+zAlEu+0JSvXaMu@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X+zAlEu+0JSvXaMu@sol.localdomain>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kwQjB-00C1eJ-2B
Subject: Re: [f2fs-dev] [PATCH AUTOSEL 5.10 10/31] f2fs: Handle casefolding
 with Encryption
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daniel Rosenberg <drosen@google.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 30, 2020 at 10:01:56AM -0800, Eric Biggers wrote:
>On Wed, Dec 30, 2020 at 08:02:52AM -0500, Sasha Levin wrote:
>> From: Daniel Rosenberg <drosen@google.com>
>>
>> [ Upstream commit 7ad08a58bf67594057362e45cbddd3e27e53e557 ]
>>
>> Expand f2fs's casefolding support to include encrypted directories.  To
>> index casefolded+encrypted directories, we use the SipHash of the
>> casefolded name, keyed by a key derived from the directory's fscrypt
>> master key.  This ensures that the dirhash doesn't leak information
>> about the plaintext filenames.
>>
>> Encryption keys are unavailable during roll-forward recovery, so we
>> can't compute the dirhash when recovering a new dentry in an encrypted +
>> casefolded directory.  To avoid having to force a checkpoint when a new
>> file is fsync'ed, store the dirhash on-disk appended to i_name.
>>
>> This patch incorporates work by Eric Biggers <ebiggers@google.com>
>> and Jaegeuk Kim <jaegeuk@kernel.org>.
>>
>> Co-developed-by: Eric Biggers <ebiggers@google.com>
>> Signed-off-by: Eric Biggers <ebiggers@google.com>
>> Signed-off-by: Daniel Rosenberg <drosen@google.com>
>> Reviewed-by: Eric Biggers <ebiggers@google.com>
>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Please don't backport this to the LTS kernels.  This is a new feature, not a
>fix, and you missed prerequisite patches...

Sure, I'l drop it. Thanks!

-- 
Thanks,
Sasha


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
