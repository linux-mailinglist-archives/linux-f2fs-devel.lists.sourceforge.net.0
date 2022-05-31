Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8E65394B2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 May 2022 18:04:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nw4MW-0002Ar-UX; Tue, 31 May 2022 16:04:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nw4MV-0002Ak-SU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 16:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5D6CIOdw6kWNBYg5H1o/ROhiEaylC2Qsg/grTFJ8lB0=; b=a7eQxOaoruzfOwPqeVwCoxqNbL
 1ybz49RlhU3I67vd7L6an8yNlNO4sKaO9l0PQgpxy4vjkODf7M/g+LScqPonq58Lp4t//19tHkq9M
 n6lqsswZphaCNMjbzKKa5UwZn202QKbjE+dlb7//ifDgNww9wrZ17tVIRWj8OI49TjDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5D6CIOdw6kWNBYg5H1o/ROhiEaylC2Qsg/grTFJ8lB0=; b=O6kY7S6pz6ZBm24L+GIP6Es/w7
 /0yDFyXV8SmfCfk1lmKEFlztiywSv9x8A2c5XhwYgK+PxNK0izcnDqyWQXfeL0fHIvwzWrMCOnnJl
 NETfZJwvVlOhhkgg66K1pQA7vnmJNkqJKxMfKWFk5bDXnFgCGLPXZvZy3kPtoVGNMW90=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nw4MS-0006nU-Jw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 16:04:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84A7E61423;
 Tue, 31 May 2022 16:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C99EC385A9;
 Tue, 31 May 2022 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654013083;
 bh=77pU4mwBBht72Ang/QQcd6KRn2N6f7Mxq8dkjBDJfeM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cXx1k+e2ECfP9Qa3v1SjLX/RR+2uUC8XMiT4t8HrIhV4SrPc6iIc3LWIKYumPonHE
 KkTxxPZCtM/QdZ1Jsg3a+OMz3kOnDrlux3Z9wC5VY2yZTSIgx0UCgPW5qp6hNLfN0p
 j2YzF2p/B+7e4V3PBvPGmjhJy9JtfYDyfOrYzcT3pwJQTUs6y+tV7y+H5wLqLbuywp
 IBmgde2ipcReL9baBDQCBHcSyTpV7MwmNmDupb2+y5cBDS3syVVPp/Nvig+GiXSVRU
 mUhBoYsuatfSKxWAt6w8lB3ZmErn2PtiQvg4RZ5f67q+RcJNOFvNZn9PWAYBhqTldL
 TgQc6zh8OSOfQ==
Message-ID: <1643075e-f830-5e0a-9c12-e32a37ca0f5d@kernel.org>
Date: Wed, 1 Jun 2022 00:04:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: fstests@vger.kernel.org
References: <20220521031621.3494402-1-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220521031621.3494402-1-chao@kernel.org>
X-Spam-Score: -8.6 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  +Cc Zorro, Any comments? On 2022/5/21 11:16, Chao Yu wrote:
 > Testcases like generic 342/502/526/527 expect that filesystems will >
 recover
 all related metadata changes to the file which was fsynced > before sudden
 power off. [...] 
 Content analysis details:   (-8.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nw4MS-0006nU-Jw
Subject: Re: [f2fs-dev] [PATCH] generic: adjust strict SPO recovery
 testcases for f2fs
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
Cc: guan@eryu.me, zlang@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

+Cc Zorro,

Any comments?

On 2022/5/21 11:16, Chao Yu wrote:
> Testcases like generic 342/502/526/527 expect that filesystems will
> recover all related metadata changes to the file which was fsynced
> before sudden power off.
> 
> This patch adjusts to use "fsync_mode=strict" mountoption for f2fs
> to pass these testcases.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   tests/generic/342 | 5 +++++
>   tests/generic/502 | 5 +++++
>   tests/generic/526 | 5 +++++
>   tests/generic/527 | 5 +++++
>   4 files changed, 20 insertions(+)
> 
> diff --git a/tests/generic/342 b/tests/generic/342
> index 676b876b..cdffaaf3 100755
> --- a/tests/generic/342
> +++ b/tests/generic/342
> @@ -31,6 +31,11 @@ _require_dm_target flakey
>   
>   _scratch_mkfs >>$seqres.full 2>&1
>   _require_metadata_journaling $SCRATCH_DEV
> +
> +if [ $FSTYP = "f2fs" ]; then
> +	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
> +fi
> +
>   _init_flakey
>   _mount_flakey
>   
> diff --git a/tests/generic/502 b/tests/generic/502
> index b0f9077f..b5589b81 100755
> --- a/tests/generic/502
> +++ b/tests/generic/502
> @@ -34,6 +34,11 @@ _require_dm_target flakey
>   
>   _scratch_mkfs >>$seqres.full 2>&1
>   _require_metadata_journaling $SCRATCH_DEV
> +
> +if [ $FSTYP = "f2fs" ]; then
> +	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
> +fi
> +
>   _init_flakey
>   _mount_flakey
>   
> diff --git a/tests/generic/526 b/tests/generic/526
> index dc7cb36c..ada4dbee 100755
> --- a/tests/generic/526
> +++ b/tests/generic/526
> @@ -32,6 +32,11 @@ _require_dm_target flakey
>   
>   _scratch_mkfs >>$seqres.full 2>&1
>   _require_metadata_journaling $SCRATCH_DEV
> +
> +if [ $FSTYP = "f2fs" ]; then
> +	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
> +fi
> +
>   _init_flakey
>   _mount_flakey
>   
> diff --git a/tests/generic/527 b/tests/generic/527
> index 40cd1c6a..de09d171 100755
> --- a/tests/generic/527
> +++ b/tests/generic/527
> @@ -32,6 +32,11 @@ _require_dm_target flakey
>   
>   _scratch_mkfs >>$seqres.full 2>&1
>   _require_metadata_journaling $SCRATCH_DEV
> +
> +if [ $FSTYP = "f2fs" ]; then
> +	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
> +fi
> +
>   _init_flakey
>   _mount_flakey
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
