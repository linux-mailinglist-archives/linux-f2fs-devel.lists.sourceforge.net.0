Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE6BC1A211
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 13:02:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eaAHdrw+MVi+vH7M+2Ju3esJwy9V4QTCn6HdaI0Lt8=; b=m2RzxmOq7h64eh/CsiR+Reg8Dz
	UG71pAbtCr1VlTPa4rsgFAxn4KFhotwZJj8I4hc5Usi9k4nubEg8jcr3a2GGOw9L5MgafDQuVsh+M
	GleZafQESEhIP43SU1YOS6p8RYDNZ03z+zkTiMN++jdCDFWk1KX2X2ojaXl7OdNdx3aA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vE4t5-000511-Re;
	Wed, 29 Oct 2025 12:02:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vE4t5-00050v-Ak
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 12:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3WSgrb6eBdX/42rOwlLlHXug5/B3ydakVgbfvpO3eqw=; b=f6g0corpGqcYj0VB28aNtFqtiY
 glqwGqSFzkDES8XqXfnwYP+wP/zlNt15GoEA08nCJtmMrAa19uWst31cF7qCPMPS9ns9g2d6q7efw
 tBTE6uq2oD7VDcbMvPq4Aztq7CE6q4JM2XZ43azpruGzNSe6BsjCJrZ0Wdfa4Ly5Wo30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3WSgrb6eBdX/42rOwlLlHXug5/B3ydakVgbfvpO3eqw=; b=KH6tDxJWF8UPIvc4X1wRRqMgwe
 64wAduZfEoVQmUSgNDJK09DWlk7p734GM67x5KVUGkm+q7bF5oGZjoqEczjQF3JTdjq0yslrRHaeR
 QVl45npoh6TUvZD6jqqxi7rluFQQTNbgd6tUgs0Uj2TSgcfevxkAvHnHUC0SmPOSwSBw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vE4t5-0000tj-H5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 12:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0984840A31;
 Wed, 29 Oct 2025 12:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1E8C4CEF7;
 Wed, 29 Oct 2025 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761739356;
 bh=FnowuDxDevMD9mwxtf2kNZdUxIQHi9dzh6ou8P39uIk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ctQ82c1pR6v5IOaKMWnF5Zoi83j1Lq4iLMqUndjC8XcxGYLeVnA/ObbfJAMKMKb9z
 K3II5fnXvLGBeTI1sZ+x1qAWERTERwL/YZS6MYYZXHpxZ9pxdk2wOJiXJfQwjY+NQd
 OjxgtLMwbM2+M2J/tKhy+FdamHdHMiysbhmBofSQv5MBEqlas7497FYuQyrMAeppzi
 GnOrxUMBKBhR5udK6TGwzn3uMjpw4GSM+46Yaj6Ev/VZVT3jBJFJ5A98RQIZ7VfYct
 aPiIup7aCMUOXWXnksZMdB1pAJcrvCbOPQElMUFjR9caUl2tWJVKME4cfvxJBcjeWj
 b/+OwV1+7yUVg==
Message-ID: <1a26766d-311c-460b-b5c3-309750b3f0a1@kernel.org>
Date: Wed, 29 Oct 2025 20:02:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joanne Chang <joannechien@google.com>, Zorro Lang <zlang@kernel.org>,
 fstests@vger.kernel.org
References: <20251029093457.183578-1-joannechien@google.com>
Content-Language: en-US
In-Reply-To: <20251029093457.183578-1-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Joanne, On 10/29/25 17:34, Joanne Chang wrote: > Currently, 
 the created files are filled with 0. When filesystem level > compression
 is used, they take up much less space than expected. So > the final falloca
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vE4t5-0000tj-H5
Subject: Re: [f2fs-dev] [PATCH v1] f2fs/011: use random data to avoid file
 compression
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Joanne,

On 10/29/25 17:34, Joanne Chang wrote:
> Currently, the created files are filled with 0. When filesystem level
> compression is used, they take up much less space than expected. So
> the final fallocate does not show an error.
> 
> The created files are filled by /dev/urandom instead to ensure they
> are not compressed. This way the files take up the same space whether
> compression is used or not.
> 
> Signed-off-by: Joanne Chang <joannechien@google.com>
> ---
>  tests/f2fs/011 | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/f2fs/011 b/tests/f2fs/011
> index c21cb586..75679b36 100755
> --- a/tests/f2fs/011
> +++ b/tests/f2fs/011
> @@ -35,8 +35,9 @@ _scratch_mount -o checkpoint=disable:10%
>  pinfile=$SCRATCH_MNT/file
>  
>  # simulate fragment status in f2fs
> -for ((i=0;i<256;i++)) do
> -	$XFS_IO_PROG -f -c "pwrite 0 1m" $SCRATCH_MNT/$i >>$seqres.full
> +dd if=/dev/urandom of=$SCRATCH_MNT/0 bs=1M count=1 2> /dev/null

IIRC, $XFS_IO_PROG is preferred in xfstests [1]

[1] https://lore.kernel.org/fstests/20250326140938.6ll7yeez6iwabvgi@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com

So, what do you think of this?

for ((i=0;i<256;i++)) do
	$XFS_IO_PROG -f -c "pwrite -i /dev/urandom 0 1m" $SCRATCH_MNT/$i >>$seqres.full
done

> +for ((i=1;i<256;i++)) do
> +	cp $SCRATCH_MNT/0 $SCRATCH_MNT/$i
>  done
>  sync
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
