Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0756E582A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Apr 2023 06:43:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1podBt-0002F6-Pd;
	Tue, 18 Apr 2023 04:43:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <error27@gmail.com>) id 1podBs-0002F0-QW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 04:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eo1dY/ttewg13qVvGQdVcJPBa1hUmnXLA4fbsLDnKVc=; b=Hf2n3NdaCIpHIts+ZIAdZK56IX
 NKsL1vJrT16C+r2QZCDlzfqKHjW3bQxcL+xzi/hOaAAD25gsZX3MZYJYfDoUYxTZfOipra8Bpmebp
 0Fzsl6V28s506IBZS5tXPjm8m7v9XZOtPiA4h/q33wZ3w2urgVp8kAqjlPOaIRTAXthw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Eo1dY/ttewg13qVvGQdVcJPBa1hUmnXLA4fbsLDnKVc=; b=KqdSGrxNJc/qNwAV63V7yCZM8b
 hwni8VZgS0jHJQEKnCZyxfIDA2uT9J+u4zPiQaZOfq2sZS+oLINKHoUuZRl9G5vwZHD2tF++GTrfY
 0rVyvRFSY9XeMIXwuhONO0pY1dUD1MgSjf+Ghkkymbt2ZgFIUtBBPx40tqbkL25eA4gI=;
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1podBn-00B83T-OZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 04:43:39 +0000
Received: by mail-wm1-f45.google.com with SMTP id
 bi21-20020a05600c3d9500b003f17a8eaedbso57984wmb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Apr 2023 21:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681793009; x=1684385009;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Eo1dY/ttewg13qVvGQdVcJPBa1hUmnXLA4fbsLDnKVc=;
 b=P2/wTxe/u056PKJtPuL+KjH/34N8gvJxmrFOtAFqIhFBOsZrLDojAOAHd6fzN2Qe7a
 iGzXEXksMsxKSwLZ6PYwwLsaj/Gg8uo251YpzBYC63H0h1MwJ+bw6QgSDSq+dghzmgF8
 4oyNsZ+xVBQ2uqyY1YX9XunXPDDw57AWSoarIHh0vT6NCnQlDYnV6F22KXHwlqhMYe1Z
 iz/7pzgOmLEwwEFG40MbXfCaSzNZE/VPyaD1tWmDhr3jM2qQ8J0H7y6OMzFa6bilAVrv
 fghW8rKmIhFUyT1XwLBvI9Ju4aguPPoFW7pLsUfQY2kPak/hdAN70gKw5nVWkPJ9zt8t
 B2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681793009; x=1684385009;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eo1dY/ttewg13qVvGQdVcJPBa1hUmnXLA4fbsLDnKVc=;
 b=LLGJ2uv8R1w9NJEmNjhiwCtKpeNYJkldIei7b2oO2Ef22dHZYF9LQv68Py0rE1OBRN
 P4LYX3iK6YyXB3FDoWDuC9vskgyFdzoUPhVfEssYv1qFSn7qpehVof/K3H2lBsXTqHLE
 tt5YMgYM1EG9TpRoqbkqtFx8F5BcBP1W+iP8PykdG3ydVv6tNtShR1irO68gRRaVNJiv
 pciiJHW8qWJrrwAtjmZ2yiNqwHH9t8NGXbUou/rylsEJJD5Q96t7YdgIShxtOvgYcE+8
 yHOwwB7HIlFpNnVhmQUXwq7zIqgLGCBT4fOmVtsWh+DRwfuVdwOLVWXcmrMtlFDO9htq
 VBiA==
X-Gm-Message-State: AAQBX9dIbDEomlCMXaLkYgzFY09lR+PG18y2UaOfkwQcZP1rHmP4v3jF
 ZZgY2mtKk04SPv5G+f/MP98=
X-Google-Smtp-Source: AKy350YCgcQ296ja4deDMuyoPZgAFD/KiSBIyP+WT9ox0lGEwO7mXcoadEYNo8ROEFvprJ8PD0y6tg==
X-Received: by 2002:a7b:c38a:0:b0:3f1:6fba:b69a with SMTP id
 s10-20020a7bc38a000000b003f16fbab69amr6614091wmj.11.1681793009247; 
 Mon, 17 Apr 2023 21:43:29 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c458400b003f0a090d798sm15629180wmo.18.2023.04.17.21.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 21:43:28 -0700 (PDT)
Date: Tue, 18 Apr 2023 07:43:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <2867d5b3-c6cb-49fa-854a-0f58f9a5adb5@kili.mountain>
References: <523ec4b037d064e92e19203e3ab9a161e3d9aa71.1681764681.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <523ec4b037d064e92e19203e3ab9a161e3d9aa71.1681764681.git.christophe.jaillet@wanadoo.fr>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 17, 2023 at 10:51:46PM +0200, Christophe JAILLET
 wrote: > > - ret2 = filemap_check_errors(NODE_MAPPING(sbi)); > - if (!ret)
 > - ret = ret2; > + ret = filemap_check_errors(NODE_MAPPING(sbi) [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [error27[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [error27[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.45 listed in list.dnswl.org]
X-Headers-End: 1podBn-00B83T-OZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove some dead code
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Apr 17, 2023 at 10:51:46PM +0200, Christophe JAILLET wrote:
>  
> -	ret2 = filemap_check_errors(NODE_MAPPING(sbi));
> -	if (!ret)
> -		ret = ret2;
> +	ret = filemap_check_errors(NODE_MAPPING(sbi));
>  
>  	return ret;

Let's get rid of "ret" as well:

	return filemap_check_errors(NODE_MAPPING(sbi));

regards,
dan carpenter



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
