Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9049052C332
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 21:22:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrPFW-0007hX-IG; Wed, 18 May 2022 19:22:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrPFV-0007hR-0Y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 19:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2vgcC0ayAe9JFSOoCPnfHB7+VRf5rldnqICYhQ730TY=; b=U4XU47yzqySfT+dEr6JTSmir3T
 uSbKf2kPnHay3bMbyRPX8T+PKbrLUwywj62vI8N621So/YgXfPzKqZ/Zjt1Oty/vDHgV/TQ2TVJuY
 U5YQX00Dnu21IqgKZaeeKnOTnMdazMJd/G8wVmLZ1RMawq5sEgjeP/3JmsNZM5iwCGAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2vgcC0ayAe9JFSOoCPnfHB7+VRf5rldnqICYhQ730TY=; b=kJKyf4icyJUM/Zp6bPlJ6AvDKd
 lioRFQ9nP5xY1G1lQRWCMNoAAoUhvkLwhKW+bbf8yUbIe6c9Tse934KQFmxjCBf7xReqDoKFlqabL
 Go2Cc/j1Xh49eXO4Ra3TGmry/yXWU/xEM5Kbe6bAxEZap/V6ZIFmj1VrSrC4em+EvHts=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrPFU-007Lh5-IG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 19:22:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35643618EC;
 Wed, 18 May 2022 19:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61601C385A9;
 Wed, 18 May 2022 19:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652901734;
 bh=0+oMuruS0sybzmrAJPzSrVZVn2r9i/tfi5shtNvvpsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pjHa5ap0uLs0/1n0HK/MwQCGLa1+8/F9cWHUjlCrXlmxz8uHR1EU4KGF4uRUKZ3JK
 +G0NK4CeQe52Pzaxdl2XbwRSgdjfWS0PyMLfsv+yVheIuIszYnNThCtlQ/Vl2TolLJ
 KA47kkBGyp3QEK+KGp1tkp4GJ5oYtwEMLa+I4O4lxhOmbo9VpgDcA88pmn9t4s8uNV
 +5AUFFxIZL6cYxzn0K0Sq5/k2TqlpTpQe05Cv9B/UNW7b2MofmH7JfSFzID+abA373
 GYArZ9YmIQmvVMNsqZut6D9XHLNeoOcoXh1jtkmk2W0f09MqakPdvWNNO8QQBIcKJR
 T8Gbm2oMLv6Zg==
Date: Wed, 18 May 2022 12:22:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YoVHZGUKxqPOLU+v@sol.localdomain>
References: <20220518172320.333617-1-krisman@collabora.com>
 <20220518172320.333617-6-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518172320.333617-6-krisman@collabora.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 18, 2022 at 01:23:17PM -0400, Gabriel Krisman
 Bertazi wrote: > @@ -277, 8 +225, 10 @@ static inline int f2fs_match_name(const
 struct inode *dir, > > #if IS_ENABLED(CONFIG_UNICODE) > if (fnam [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrPFU-007Lh5-IG
Subject: Re: [f2fs-dev] [PATCH v5 5/8] f2fs: Reuse generic_ci_match for ci
 comparisons
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 18, 2022 at 01:23:17PM -0400, Gabriel Krisman Bertazi wrote:
> @@ -277,8 +225,10 @@ static inline int f2fs_match_name(const struct inode *dir,
>  
>  #if IS_ENABLED(CONFIG_UNICODE)
>  	if (fname->cf_name.name)
> -		return f2fs_match_ci_name(dir, &fname->cf_name,
> -					  de_name, de_name_len);
> +		return generic_ci_match(dir, fname->usr_fname,
> +					&fname->cf_name,
> +					(u8 *) de_name, de_name_len);
> +

There's no need for the cast to '(u8 *)'.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
