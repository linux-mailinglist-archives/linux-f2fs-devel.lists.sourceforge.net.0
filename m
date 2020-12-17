Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2112DD415
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 16:24:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DBhb7yXMG+brLbg57kZNbe5MDOwVT6ANIuhxSNsmY0U=; b=fQrGU+V78UPu++mOTswZAmFZN
	H0RIIP8OY9hzibPj6C98jXCJ0XkJEEM0QzuJ9DM5yRX3kYRi4PoV4AfZn2d69EMLlIEAUORATVT+w
	UQwqqROKOSXxWmOte//T1TO+RYX2eznBkGU6Wj8On8y4PeCbtSP9yTp6IzsP9vdxCL8m0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpv9C-0006To-Gu; Thu, 17 Dec 2020 15:24:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kpv9B-0006Ti-RZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kIz7GYcd9kc7NiTcGubc3hHNTjDCxZzzCffmZhlzieY=; b=AJjtGunuwehHAHCwbMR/HqrtXY
 0wl1dm0vAO4GKhQK/TJk45xuibpxVAMcL+dc5Br2Ct/IaVddqSKwaSIIV75C8N2Vl/aJAnC0WYLxU
 vpTZvfP1upC+qWAdupHrbm4CFSayMxwkmCV41XRdHyfYNFVd0/KG/8ocFiGQmx0fqz/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kIz7GYcd9kc7NiTcGubc3hHNTjDCxZzzCffmZhlzieY=; b=aZEhjrHMnDt54X/BLYRyRQ7gq5
 JOqbVWD6fuB9x9eZEzdQR/k16Ip13Y0Mqyxx3H8myWC9HaZLDuRfNu4FdXbKXkk1ntYFF9Z+iSzo3
 QUywee89CaKkZ0mb4IX7JyLL27WxbD6Y6uA5aVpB1hxmzI0tOPHOLTREmn9I5EnBzH7c=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpv94-000G82-PY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:24:53 +0000
Received: by mail-pf1-f173.google.com with SMTP id s21so19212904pfu.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 07:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kIz7GYcd9kc7NiTcGubc3hHNTjDCxZzzCffmZhlzieY=;
 b=HdoR+iFCYRI8AX3ZC7L1wYTUXMHVnCkfMb7AsbGtq49mvOe4eaYbBaXdPeS/tOggjh
 iaGCtAS6t/o/Dw6Km6dwfoP5Kn4RuOjK3o0f7FbZMYEwR5xRRpoh45/UEPDl0xYQxPwQ
 rQ3ilEs3t8z2AMU7jLByMRyXgtvAe5MCCqWUjZnRO/EutWuf2E9G8vKVIo7AWHN8FXnU
 xQ3cAH1mArHyt/2iHI9koyx5v1B/Tn5ruroIIn5q13cbbGDaM2CckDP0Zw0+5LbcwKpb
 QIITTuK0z3KpzYvw8oEGE7wj71OzKAsgh9qTnSqUSqY9IPOA+7TjA/8YF2ebPkMJYwnq
 c4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kIz7GYcd9kc7NiTcGubc3hHNTjDCxZzzCffmZhlzieY=;
 b=keCc6UvgFjpIT+q23dD2xpfitR8I1EDLwKn0GFp4NCTPRMy5xDAAJ5HGyZQEc9DpGu
 bqG92REmf5CRQAPx4/SyZyAfSUI/7MjzQNnq7yo735ICyraRoJ94+QvPN4L+8vGMMz3q
 lic2KDJQVZXfgkNjvr20oB6FCuUcZsjN1LnFdD8vj/9RHTUqNf4XznbWy+YoJCKBWZxJ
 +FJxw1WFKQKnd6n/XcE6Odcp7fNY3+ADYmU+dkxy4rOAlM5CjHGHgcnN76AxTrYypaRX
 E8PhV/e/O/KqtiXkonj7yHCBB1zuJ4J8JDL+vMv2nAdryBSBCwG8YtMFvYvzFd03GLiu
 iIsQ==
X-Gm-Message-State: AOAM530l30EtKKcLXHwkFvynApaUpQqAGV/2MUCweClsKRoTTgMJkVB0
 3M2dcutL/tVTko5NEIKa509gAw==
X-Google-Smtp-Source: ABdhPJzOVkjbRMywF5FZEc40FxzXtgaCv38qyhyJ7q4OV4GZm3JysAsFd7f3WjwnxMINhtTfcXvOCA==
X-Received: by 2002:a63:2347:: with SMTP id u7mr18664863pgm.189.1608218681110; 
 Thu, 17 Dec 2020 07:24:41 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id h12sm6466839pgs.7.2020.12.17.07.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 07:24:40 -0800 (PST)
Date: Thu, 17 Dec 2020 15:24:37 +0000
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <X9t4NXGM7cbxsimQ@google.com>
References: <20201217150435.1505269-1-satyat@google.com>
 <20201217150435.1505269-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217150435.1505269-3-satyat@google.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.173 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kpv94-000G82-PY
Subject: Re: [f2fs-dev] [PATCH v2 2/3] fscrypt: Add metadata encryption
 support
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-fscrypt@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I'm not yet done with the xfstests that Eric asked for - I'll send them
out as soon as they're done.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
