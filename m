Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 371FD2E2665
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Dec 2020 12:32:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cT5Aew1XCAtOHlQoUpBP9G5ljBzTliNxnJ80OT8RBkg=; b=diiH2Xr/147L0cAW/AN66rmaw
	4zBFFwHELnBEZzFikcSC4RnANuynXyHq0dh5Gz89yJilQ842nfCBFBO3zHgM33ViGPwoAmAnPi7E2
	v7b7o+gQvd5qfQndNzrXsEv2HiEdqMmiX+MVeJbcmEJb807QFN79LJJVDMP/0s38L4LO0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ksOqa-0002M7-JC; Thu, 24 Dec 2020 11:31:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1ksOqZ-0002M0-FV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Dec 2020 11:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zXY42oT/IW9W4tJIWg8idExqObCy32gAmaijR4rjF1k=; b=QWCs+DI983iDbR2ZhFTEjCSN3b
 X5qR7gAh5XrdpDLyGWVF1exS8NaTYqzvQ/QrZKcqv6CFW9q3QrZwkiZlyMhFiIHXQYPWfWB3812Fo
 bdwNy2wAkyVj7PmVua/RtwywrN7OJWkQi5Oa/z/r7VP6dLeWb0d7OIlbu5jbd7PF0LhI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zXY42oT/IW9W4tJIWg8idExqObCy32gAmaijR4rjF1k=; b=OJIut4gg0qX7rpo1mC14HS3XZf
 D+hkFZdLCp8ElITZj0gyClyym3XwehNh7TuZlxpqZtgO+//+eEGwbia7RvMKFFb69pskUubGcSTz6
 Gm/dN5700N2YItTl7Zbnc8WJ2/14v1WFD9WplcHMPuuzRW9bYBX6Y7j8WkB0MXipSfYs=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ksOqT-008vuR-B4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Dec 2020 11:31:55 +0000
Received: by mail-pf1-f169.google.com with SMTP id w6so1131441pfu.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Dec 2020 03:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zXY42oT/IW9W4tJIWg8idExqObCy32gAmaijR4rjF1k=;
 b=tasYL7NDdsgjOvHsXfKiTg6RsX2VVEUiR660KdKbDAJ+anhfmdQGDkX9vzI9qE2Wfg
 D6CeLXOpsNtajFrjEg2Kvpdfgsj7zQdVdmTG+jUtqGd1+Pp7+QThscCz2HLI9mMqJ3o2
 dnMwIAO73+R0XDxY+xKffYS0w3tw3bIFYQrGL8FZHuQ/ec4dfPahw74XJT0/o6xJnbFI
 W39UfHSs6lFt0bVZ9+nlZnKy5u4ydbzCc+9Exuht45c/sHxUwOjaF0RNGSku1CalxHou
 nVCyE/e2FwtffzyOZCkBq3UznvsQhtbMLxlGeksuI4rpaLVzY6atQdcL0/e9UKOAIOoX
 B8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zXY42oT/IW9W4tJIWg8idExqObCy32gAmaijR4rjF1k=;
 b=kcS4puGOKI6X7r6q/TYF70mwwZcBG/fdNUouJ4HWM0gQgWZuL5nmP6jB9ooNPmasqU
 oe3XIE6Kkj3p3sZgj/eV66eUuX7X5lTgnUoMxJZ/0MT6Zx0SRyCfJemYwJS5Qp5UmnrH
 OvZa1rvMRW8zwYqy+DrfQJc9onXuG0KDmR+ATyrSdA1/BV5Qg7bYgxHDCnb8v8olfrOB
 +h+6uitKY/dCjwt9HRMP/QD1GiR8DF0B+mOp6bK6pR2wckY1/IismdHAkIvOPeu8s/F9
 ZmgWEZNSNt0Iqf8peXOz62EvlVZFVO3CL5uCvq8Lty6JR9/XNuz/0X7/gkkiQgzmtbXg
 fCFA==
X-Gm-Message-State: AOAM531Saku491VrjvIbaB+v3XdLf6jSfQd/WBPXr9zLURo0bScBq5MH
 WFY9R93g5+hikL7wc+DqwO5+Lw==
X-Google-Smtp-Source: ABdhPJzGhpTmNmlaMaxMdc175O0Y77lm3F7udCcKdqjz0RRMYX0sonEKFyMyDx9SO3y79wBhWWcHgA==
X-Received: by 2002:a65:494f:: with SMTP id q15mr28291332pgs.367.1608809503493; 
 Thu, 24 Dec 2020 03:31:43 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id x125sm13594315pgb.35.2020.12.24.03.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 03:31:42 -0800 (PST)
Date: Thu, 24 Dec 2020 11:31:39 +0000
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <X+R8G5/Htwau2b34@google.com>
References: <20201217150435.1505269-1-satyat@google.com>
 <20201217150435.1505269-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217150435.1505269-3-satyat@google.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.169 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1ksOqT-008vuR-B4
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

I realized I didn't update fscrypt_mergeable_bio() to take metadata
encryption into account, so bios will be more fragmented than required.
I'll fix it in v3.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
