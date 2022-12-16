Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EED2964F2DE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Dec 2022 22:03:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6Hr9-0003Dd-N4;
	Fri, 16 Dec 2022 21:03:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p6Hr0-0003DS-DE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 21:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LymuujPs75Yv4DyfsS49FsYO3eGgTA4LqDQcoVqM0KY=; b=arRd36j65323QACzn2zKyOLTMk
 wRMI5QmpQRSyxfiWUAVtKHGkKT+EnoXLK+zwkzWHpFT1g25hHG3GuG6d5cenEzmCaWGhQK7ZjrQGL
 o3qR7TqGnLD9tzjAtwhbv7ov34Bee9S9SS9a+TLBYa/9hkrmAYLo0V3WE7aZKxRiKH58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LymuujPs75Yv4DyfsS49FsYO3eGgTA4LqDQcoVqM0KY=; b=Gz54VeNrHzxXgtQlXyP0S92GrO
 yp6JhSK+uGAvRJMmfdIxa47rqJL/IqEbZf+bRktypZwP05L+KwilMIzpoYR6uzJSB6fQA91IU4Vhz
 xvh1g5fnQHZLmwJNeVeNa2jAMo241nb90jHapGtW+IMhpKROMrl8sc3HkBebyynVrOjI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6Hqz-001lfh-KM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 21:02:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5797CB81DA1;
 Fri, 16 Dec 2022 21:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED6BC433D2;
 Fri, 16 Dec 2022 21:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671224562;
 bh=fN6m4VVYYGNJr/6EwOlSmEnRz+a52skh6EEXOuEbYAA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eVyOzd9RrBpCgJg75WD8MZcN/gi1IB8OPt6rX3Zzx/yYmmEZwjchzPb24tjMuIeni
 tlZOy5hepolDqmDwN6RI+l8mWiFqaPi+Y0qYbu3Q95I138XpgZS7NgV1Y734GmMRpJ
 6AyhmJWUsG06S8e+wtyFB8A4Ijq5pNRljDUveS6IUa8zxWE5mPZGQZnj9Exg2cco8G
 3hcmfwjE3i+1omxMkMOAIUvoht8D1qUIVtvyLeIJ0/EZMjwtfewRJm3XX9iD4e0Bfa
 3PQ+ku7tCHI5lo+ymT7FpDUKq20Tuj/nz67h0MWrqm6YecfgC0y/of5Z25PWvm5f9i
 PZPdc7K0z+qmQ==
Date: Fri, 16 Dec 2022 13:02:39 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Fan Wu <wufan@linux.microsoft.com>
Message-ID: <Y5zc74DPqamqs+rH@sol.localdomain>
References: <20221208033548.122704-1-ebiggers@kernel.org>
 <eea9b4dc9314da2de39b4181a4dac59fda8b0754.camel@debian.org>
 <Y5JPRW+9dt28JpZ7@sol.localdomain>
 <20221209221719.GA3055@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221209221719.GA3055@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 09, 2022 at 02:17:19PM -0800, Fan Wu wrote: >
 We have also noticed many use cases for the fs-verity build-in signatures.
 Proposals > exist to use them[1]. Package managers were updated to [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p6Hqz-001lfh-KM
Subject: Re: [f2fs-dev] [PATCH] fsverity: mark builtin signatures as
 deprecated
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
Cc: Victor Hsieh <victorhsieh@google.com>, Jes Sorensen <jsorensen@meta.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Luca Boccassi <bluca@debian.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 09, 2022 at 02:17:19PM -0800, Fan Wu wrote:
> We have also noticed many use cases for the fs-verity build-in signatures. Proposals
> exist to use them[1]. Package managers were updated to use them[2]. We are
> successfully using them in production. Therefore we prefer to keep the existing
> build-in signatures.
> 
> [1]https://fedoraproject.org/wiki/Changes/FsVerityRPM#Enable_fs-verity_in_RPM
> [2]https://github.com/rpm-software-management/rpm/issues/1121

Aren't those the same project?  I already mentioned in the commit message that
it was rejected from Fedora and seems to have been abandoned.  So it seems to be
something that didn't actually work out.  Let me know if you know of anything to
the contrary...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
