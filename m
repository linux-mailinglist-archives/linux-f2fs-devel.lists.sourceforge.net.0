Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id guojEFclKGou/AIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Jun 2026 16:38:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 723A7661366
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Jun 2026 16:38:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="R/Vwuq2N";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=MDz1RTAO;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=YMXBJhBf;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=X6+bIDKL;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsY0wdtRoyMjP4/3Xr6Ou6VO9g09AzaE6iDBWsf2nRI=; b=R/Vwuq2NMxtrNmZhz2DKsOdPC6
	8NVIpoaRPvtwNatqy5LE6ciODZU7xmrZAsXDACzyLEvO16bjxmfVqTqCooJF/KqfKvIoAMFwYK2gJ
	UVJ5iPFlOZN3EO2Klkjdj8SjLJY+fyaLgeiZUB349KNXmrcjP87wO/MUPLDEvF+O8/e4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wWxaZ-0007Bc-Jp;
	Tue, 09 Jun 2026 14:38:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wWxaY-0007BO-B5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jun 2026 14:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lL08VxpC+fvKfvxxiZW5i89/CQrjnPa2IrCmxpJFjzU=; b=MDz1RTAOivPTO2mulNUhSzN2Cl
 rvT5f/f8bnLILvaNajDtJYMuv7bw8fgbvmcTnlc1RtnIyzvli+0FpnXq18+109vNDHTVohNNocOEn
 7Mi/+ARLAEGu9z9P805344dzD/UZcmrV2g1PLOJcuh43fY81kyO8PPGn0/hv0Hjc/E6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lL08VxpC+fvKfvxxiZW5i89/CQrjnPa2IrCmxpJFjzU=; b=YMXBJhBf8Zl9VMwKXf3xU41+Gm
 SNzOj9txSv9GXiphcHwD9ntPQfiMf9UL17IXYqxfFg6hrunIkwmxdV4EFyx3h5bSLVxRDpOmQOE8X
 ooNUjoNT+HIQoli71G9vUlNGDXJaykeBFki6di7CcohT9vJEOpdHMH6eFGV4pcdWfeNY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wWxaX-0004eM-84 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jun 2026 14:37:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id 6515140193;
 Tue,  9 Jun 2026 14:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3A4791F00893;
 Tue,  9 Jun 2026 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781015867;
 bh=lL08VxpC+fvKfvxxiZW5i89/CQrjnPa2IrCmxpJFjzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=X6+bIDKLdkj2W0Lb7IltN17ZG2SOht70RK/4CN90rs/RaFDcXTKPK90ZKgElO8hCT
 o9/5CpKIkEISeBQZKusBNnqymcuLjpOYZShxN7CSIq+9fVe/B0lw7FvygEoWlN071n
 AoYxrdFZ7Nv2s0FAWgiYFwkbWxroS0smkPCU0UuERhs67aooJYOi5QwmmWl1El5jz4
 PM4xcwc+U0QrAZGBvulYq2JfVzUWEjz73k6IvLs/fhIV/ZMpXDPn3tWNVzIB5vWWql
 bzUSvmXvNCvSEiHPaPt3sKcHofH04djqtyChyd2wTUpGf9r5cNkLs9HFMdSbI8akKH
 mavK6tlp7TALw==
Date: Tue, 9 Jun 2026 07:37:46 -0700
To: Anand Suveer Jain <asj@kernel.org>
Message-ID: <20260609143746.GL6070@frogsfrogsfrogs>
References: <cover.1779939330.git.asj@kernel.org>
 <421c7cdd5aae27b99d04dddf08c5d9df79c2f790.1779939330.git.asj@kernel.org>
 <20260529042743.GB6070@frogsfrogsfrogs>
 <9c0989d8-202f-42ab-9347-df082c25aa72@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c0989d8-202f-42ab-9347-df082c25aa72@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 08, 2026 at 10:39:04PM +0800, Anand Suveer Jain
 wrote: > On 29/5/26 12:27, Darrick J. Wong wrote: > > On Thu, May 28, 2026
 at 12:05:32PM +0800, Anand Jain wrote: > > > Introduce _loop_imag [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wWxaX-0004eM-84
Subject: Re: [f2fs-dev] [PATCH v6 01/11] fstests: add
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:asj@kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,frogsfrogsfrogs:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 723A7661366

On Mon, Jun 08, 2026 at 10:39:04PM +0800, Anand Suveer Jain wrote:
> On 29/5/26 12:27, Darrick J. Wong wrote:
> > On Thu, May 28, 2026 at 12:05:32PM +0800, Anand Jain wrote:
> > > Introduce _loop_image_create_clone() and _loop_image_destroy() to mkfs an
> > > image file and clone it to another image file, and attach a loop device to
> > > them. And its destroy part.
> > > 
> > > Signed-off-by: Anand Jain <asj@kernel.org>
> > > ---
> > >  common/rc | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 63 insertions(+)
> > > 
> > > diff --git a/common/rc b/common/rc
> > > index 79189e7e6e94..d7e3e0bdfb1e 100644
> > > --- a/common/rc
> > > +++ b/common/rc
> > > @@ -1520,6 +1520,69 @@ _scratch_resvblks()
> > >  	esac
> > >  }
> > > +# Create a small loop image, run an optional tuning function ($2) on it,
> > > +# clone it, and attach both to loop devices, returned in ($1).
> > > +# Args:
> > > +#   $1: Nameref to return the array of allocated loop devices [base, clone].
> > > +#   $2: Optional callback function to tune the base filesystem before cloning.
> > > +_loop_image_create_clone()
> > > +{
> > > +	local -n _ret=$1
> > 
> > That switch   ^^ is very clever.  I always wondered how one did indirect
> > variables in bash.
> > 
> > > +	local pre_clone_tune_func="$2"
> > > +	local img_file=$TEST_DIR/${seq}.img
> > > +	local img_file_clone=$TEST_DIR/${seq}_clone.img
> > > +	local size=$(_small_fs_size_mb 128) # Smallest possible
> > > +	local loop_devs
> > > +
> > > +	# Since we copy the block device image, we keep its size small.
> > > +	_require_fs_space $TEST_DIR $((size * 1024))
> > > +
> > > +	_create_file_sized $((size * 1024 * 1024)) $img_file ||
> > > +				_fail "Failed: Create $img_file $size"
> > > +
> > > +	loop_devs=$(_create_loop_device $img_file)
> > > +	_ret=($loop_devs)
> > 
> > Should this check that a loopdev actually got created?
> > 
> 
> Hmm, in the function _create_loop_device(), we are
> calling _fail if create fails, so no need to duplicate, right?

Oh right.  Question withdrawn.

> > > +	case $FSTYP in
> > > +	xfs)
> > > +		_mkfs_dev "-s size=4096" ${loop_devs[0]}
> > > +		;;
> > > +	btrfs)
> > > +		_mkfs_dev ${loop_devs[0]}
> > > +		;;
> > > +	*)
> > > +		_mkfs_dev ${loop_devs[0]}
> > > +		;;
> > > +	esac
> > > +
> > > +	# Only execute if the function argument is not empty
> > > +	if [ -n "$pre_clone_tune_func" ]; then
> > > +		$pre_clone_tune_func ${loop_devs[0]}
> > > +	fi
> > > +
> > > +	sync ${loop_devs[0]}
> > > +	cp $img_file $img_file_clone
> > > +
> 
> 
> > > +	loop_devs="$loop_devs $(_create_loop_device $img_file_clone)"
> > 
> > 	local lodev="$(_create_loop_device ...)"
> > 
> > 	test -z "$lodev" && _fail "second loopdev not created"
> > 	_ret+=("$lodev")
> > 
> > ?
> 
> If the second `_create_loop_device()` happens to fail, it will
> already have called `_fail`, so "second loopdev..." won't be
> used at all.

<nod> Both comments withdrawn :)

--D

> 
> Thanks, Anand
> 
> 
> 
> > > +
> > > +	_ret=($loop_devs)
> > > +}
> > > +
> > > +# Teardown loop devices and delete their underlying backing image files.
> > > +# Accepts a list of loop device paths (e.g., /dev/loop0 /dev/loop1).
> > > +_loop_image_destroy()
> > > +{
> > > +	for d in "$@"; do
> > > +		# Retrieve the path of the backing file
> > > +		local f=$(losetup --noheadings --output BACK-FILE $d)
> > > +
> > > +		# Detach the loop device from the backing file
> > > +		_destroy_loop_device "$d"
> > > +
> > > +		# Clean up the backing disk image file
> > > +		[ -n "$f" ] && rm -f "$f"
> > > +	done
> > > +}
> > >  # Repair scratch filesystem.  Returns 0 if the FS is good to go (either no
> > >  # errors found or errors were fixed) and nonzero otherwise; also spits out
> > > -- 
> > > 2.43.0
> > > 
> > > 
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
