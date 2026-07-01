Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z+bsA3JJRWpj+AoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Jul 2026 19:08:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 115686F02B0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Jul 2026 19:08:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=QyJyYPmO;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="N/H+jSjG";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=mBZ9YKya;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=AGHmrzkn;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGe2/G88gbherDRqK2Xgt2pxKNge4UmD56o9g72KnLE=; b=QyJyYPmOEopKNthfoFuwN2Stow
	bnrhyzlnlIsv74E9hp9XORhNVLBDxFr2zh/2Gb/RHgcMn+taNi9retFLSyJ5jAyVBaWDxWA0MmJwg
	3XBN59AoKkz8LCDKyL4YroNRoINUEKejz4WmpDT2FTlfzIZkDP+5HTdjpSWhzVQEBOGs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weyPe-0001WY-SY;
	Wed, 01 Jul 2026 17:07:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1weyPE-0001V6-JN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Jul 2026 17:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=09HWxDVeypl9bxp+WG1vrJ1WtSL6U/JuJK1E737LUCA=; b=N/H+jSjG9s9u+B9hHpddC9geOP
 TpCMxDlbMUnHfeaArDViOEtCaogYxNb4uxqnhdFrSwEk62nDDzbtsPo91hI0gUqlYF5TlACo3YUoD
 1Q9QEB2ly5DhXhPGOlLvw93P+VFn/PUlytprtiw5w4n7cohnbYEDvMwKTYH4iHetVrP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=09HWxDVeypl9bxp+WG1vrJ1WtSL6U/JuJK1E737LUCA=; b=mBZ9YKyaIACXDRj3I9Ds1/IUbB
 zctG13CtVLjxn/e2O4C0OoYs+X4lNIYJEmgdgpTCvUX1qf67dhOqWOik3UklACCN/avtQlWIE/vDU
 VC786bXBDD2YZLGWptY6lPgJ2ZCMEIwSd69sxosQ2bpkwgWnx7OQUUBzPwwbIjQbH+4o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1weyPE-000879-9g for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Jul 2026 17:07:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id D8B3060138;
 Wed,  1 Jul 2026 17:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 820C61F000E9;
 Wed,  1 Jul 2026 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782925633;
 bh=09HWxDVeypl9bxp+WG1vrJ1WtSL6U/JuJK1E737LUCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=AGHmrzknDfNiq8VGRsyT1WFe2XL3uXXaXIZCL1ui2djLdJIfnfHuKxEU5syp72KCh
 qyw1hcOzqCvu2hcXWvuASMVwcOvjBB5yIjrYbGUHX4hdpo6UTXoHGaraxCIpWMGD1Q
 P9ruQ8vDAbzuTw0vM/87Ch1imZyFfR5kGZlDtNDA0XR1l3pFlt2+jT8/FTgt7T1amF
 DK6cAPHT4dhE3+JKGwEgPW9uHZ/qDRQ9N0Jp8uYAlBC5sW7eydUQNJkWnd+ueuDNr9
 c/0Jtb1npDKnM4thmBgtBFOpo4PtB444XJwEC5ky+GhOwrv2BwLANruV8uHOedK5Uw
 1i9rzrCEqUExA==
Date: Wed, 1 Jul 2026 10:07:13 -0700
To: Anand Jain <asj@kernel.org>
Message-ID: <20260701170713.GE6517@frogsfrogsfrogs>
References: <cover.1781694879.git.asj@kernel.org>
 <421c7cdd5aae27b99d04dddf08c5d9df79c2f790.1781694879.git.asj@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <421c7cdd5aae27b99d04dddf08c5d9df79c2f790.1781694879.git.asj@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 17, 2026 at 07:20:28PM +0800, Anand Jain wrote:
 > Introduce _loop_image_create_clone() and _loop_image_destroy() to mkfs
 an > image file and clone it to another image file, and attach a lo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1weyPE-000879-9g
Subject: Re: [f2fs-dev] [PATCH v7 01/11] fstests: add
 _loop_image_create_clone() helper
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: hch@infradead.org, zlang@redhat.com, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:asj@kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 115686F02B0

On Wed, Jun 17, 2026 at 07:20:28PM +0800, Anand Jain wrote:
> Introduce _loop_image_create_clone() and _loop_image_destroy() to mkfs an
> image file and clone it to another image file, and attach a loop device to
> them. And its destroy part.
> 
> Signed-off-by: Anand Jain <asj@kernel.org>
> ---
>  common/rc | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/common/rc b/common/rc
> index 79189e7e6e94..d7e3e0bdfb1e 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -1520,6 +1520,69 @@ _scratch_resvblks()
>  	esac
>  }
>  
> +# Create a small loop image, run an optional tuning function ($2) on it,
> +# clone it, and attach both to loop devices, returned in ($1).
> +# Args:
> +#   $1: Nameref to return the array of allocated loop devices [base, clone].
> +#   $2: Optional callback function to tune the base filesystem before cloning.
> +_loop_image_create_clone()
> +{
> +	local -n _ret=$1
> +	local pre_clone_tune_func="$2"
> +	local img_file=$TEST_DIR/${seq}.img
> +	local img_file_clone=$TEST_DIR/${seq}_clone.img
> +	local size=$(_small_fs_size_mb 128) # Smallest possible
> +	local loop_devs
> +
> +	# Since we copy the block device image, we keep its size small.
> +	_require_fs_space $TEST_DIR $((size * 1024))
> +
> +	_create_file_sized $((size * 1024 * 1024)) $img_file ||
> +				_fail "Failed: Create $img_file $size"
> +
> +	loop_devs=$(_create_loop_device $img_file)
> +	_ret=($loop_devs)
> +
> +	case $FSTYP in
> +	xfs)
> +		_mkfs_dev "-s size=4096" ${loop_devs[0]}

Not sure why you pass two separate cli arguments as a quoted string, but
my guess is it "doesn't matter" because _try_mkfs_dev uses $* unquoted,
which separates them again.

I HATE BASH.

> +		;;
> +	btrfs)
> +		_mkfs_dev ${loop_devs[0]}

And while I'm whining:    ^^^^^^^^^^^^^^^ actually should be quoted.
Not that fstests is at all good at getting this right.

> +		;;
> +	*)
> +		_mkfs_dev ${loop_devs[0]}
> +		;;
> +	esac
> +
> +	# Only execute if the function argument is not empty
> +	if [ -n "$pre_clone_tune_func" ]; then
> +		$pre_clone_tune_func ${loop_devs[0]}
> +	fi
> +
> +	sync ${loop_devs[0]}
> +	cp $img_file $img_file_clone

What if cp doesn't create a reflink copy?  Can we fill up the $TEST_DIR
despite having checked it for sufficient free space?  Especially on
filesystems that don't support sparse holes?

> +
> +	loop_devs="$loop_devs $(_create_loop_device $img_file_clone)"
> +
> +	_ret=($loop_devs)

Hmm.  Should this function return nonzero if any part of the clone
creation fails?  Or are callers expected to notice that _ret only has
one element?

--D

> +}
> +
> +# Teardown loop devices and delete their underlying backing image files.
> +# Accepts a list of loop device paths (e.g., /dev/loop0 /dev/loop1).
> +_loop_image_destroy()
> +{
> +	for d in "$@"; do
> +		# Retrieve the path of the backing file
> +		local f=$(losetup --noheadings --output BACK-FILE $d)
> +
> +		# Detach the loop device from the backing file
> +		_destroy_loop_device "$d"
> +
> +		# Clean up the backing disk image file
> +		[ -n "$f" ] && rm -f "$f"
> +	done
> +}
>  
>  # Repair scratch filesystem.  Returns 0 if the FS is good to go (either no
>  # errors found or errors were fixed) and nonzero otherwise; also spits out
> -- 
> 2.43.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
