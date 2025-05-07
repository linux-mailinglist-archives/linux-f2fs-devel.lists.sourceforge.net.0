Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8415DAAE3BD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 17:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/s/53OX9iMJYcMPMJ055ZwK7D8NBMvNFhOBZtrTXKk=; b=kGVaFlIIEkvt5UfpwHY92fKJhl
	cUQG9Aune9GqWBDseB3amASkQsteN/iEWjjhKpYyWBpDg8C1URF9UMYTf2O0WyQTNQs/5ASoHojCe
	ZLMbLQTPa0TeomS9b6wDblmZdZhAsthDnIFD893pbGfd/0Q2C8RHE+jRFaEVebIpaI0k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCgIT-0002vq-TY;
	Wed, 07 May 2025 15:02:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uCgIS-0002vb-Dr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 15:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KOEzEGziAxUROhVkgzcbcoWconRdAZiNxPBUls3oCnU=; b=deknYNMCU6v8plXpZlaoF4F6Sh
 UMJ7T1unKgGFTpnLwreE/QcUDLEkTiSXdKVbU+g/KUW5AsbfUP//4ptnwCeInxvEiO3yxZ3eFqtp/
 E+BhnTMT7QR7VflDtj33LyA6vqcIIffa2KFyYTu9ZnOPt2E+AOeNBPm8voFzjxSr2TiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KOEzEGziAxUROhVkgzcbcoWconRdAZiNxPBUls3oCnU=; b=L3H5muJmBk0TWz4JyNnlH+mErX
 METjNJwyGo2obWOR1jpslZWOXr08BeNHrEVGdgBzzdLztzrVoeWgqg10wqmELC0zbKOkhSN3OWaT9
 Rg5Y9bBW/Gck4TBgXTRgMc0ABEIug4ppudi3YiT1478gwwHIR842uy5jqmAEHsPOEFB0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCgIC-0004Jp-Sp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 15:02:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60A2F44418;
 Wed,  7 May 2025 15:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011D1C4CEE9;
 Wed,  7 May 2025 15:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746630155;
 bh=C3hKf6zUM2iwJaaEM6d5NG8bscA/uwedt9zyDhq/gJY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RlLyWyhOE4fynVjBjR2zDEybj3DpCrntBeIXcvoR2xm4KaD1PlMfZhWVkItO3EkDO
 ikQHVIzEqHB30FW+t1XjBw/skBtFK7tnz8hh2wVeHbJwIC1STWLtf4+80kt0st+rhq
 UuIm8pIpys9mhuxh90sSZe4uBcaB4cPc82WE5El5dff2Zy+YoXoRCvHVTEnURxxObp
 BPnHC8EfG8zjcyd5dHEmSil7anV+GPNmRv5VQowT1fRdFzmiPHJewlgG62qRpfdGps
 N7gTM8QJD1RHD1zb+jGltnXY6VwIbnv8E9AXhfH0yKM6HN8EEbThyfNn1HYm8zwQiE
 m2V454mINaKfw==
Date: Wed, 7 May 2025 15:02:33 +0000
To: Eric Sandeen <sandeen@redhat.com>
Message-ID: <aBt2CVnq8LnrbMzn@google.com>
References: <20250420154647.1233033-1-sandeen@redhat.com>
 <20250420154647.1233033-3-sandeen@redhat.com>
 <2e354373-9f00-4499-8812-bcb7f00a6dbc@kernel.org>
 <db0c33f2-9fa0-4ee7-b5c9-e055fcc4d538@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db0c33f2-9fa0-4ee7-b5c9-e055fcc4d538@redhat.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/07, Eric Sandeen wrote: > On 5/7/25 6:26 AM, Chao Yu
 wrote: > > On 4/20/25 23:25,
 Eric Sandeen wrote: > >> From: Hongbo Li <lihongbo22@huawei.com>
 > >> > >> In handle_mount_opt, we use fs_parame [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCgIC-0004Jp-Sp
Subject: Re: [f2fs-dev] [PATCH 2/7] f2fs: move the option parser into
 handle_mount_opt
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/07, Eric Sandeen wrote:
> On 5/7/25 6:26 AM, Chao Yu wrote:
> > On 4/20/25 23:25, Eric Sandeen wrote:
> >> From: Hongbo Li <lihongbo22@huawei.com>
> >>
> >> In handle_mount_opt, we use fs_parameter to parse each option.
> >> However we're still using the old API to get the options string.
> >> Using fsparams parse_options allows us to remove many of the Opt_
> >> enums, so remove them.
> >>
> >> The checkpoint disable cap (or percent) involves rather complex
> >> parsing; we retain the old match_table mechanism for this, which
> >> handles it well.
> >>
> >> There are some changes about parsing options:
> >>   1. For `active_logs`, `inline_xattr_size` and `fault_injection`,
> >>      we use s32 type according the internal structure to record the
> >>      option's value.
> > 
> > We'd better to use u32 type for these options, as they should never
> > be negative.
> > 
> > Can you please update based on below patch?
> > 
> > https://lore.kernel.org/linux-f2fs-devel/20250507112425.939246-1-chao@kernel.org
> 
> Hi Chao - I agree that that patch makes sense, but maybe there is a timing
> issue now? At the moment, there is a mix of signed and unsigned handling
> for these options. I agree that the conversion series probably should have
> left the parsing type as unsigned, but it was a mix internally, so it was
> difficult to know for sure.
> 
> For your patch above, if it is to stand alone or be merged first, it 
> should probably also change the current parsing to match_uint. (this would
> also make it backportable to -stable kernels, if you want to).
> 
> Otherwise, I would suggest that if it is merged after the mount API series,
> then your patch to clean up internal types could fix the (new mount API)
> parsing from %s to %u at the same time?

Yeah, agreed we'd better applying the type change later, once mount API is
successfully landed. Chao, let's keep checking any missing cases. :)

> 
> Happy to do it either way but your patch should probably be internally
> consistent, changing the parsing types at the same time.
> 
> (I suppose we could incorporate your patch into the mount API series too,
> though it'd be a little strange to have a minor bugfix like this buried
> in the series.)
> 
> Thanks,
> -Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
