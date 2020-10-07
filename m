Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70881286ABD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Oct 2020 00:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3TWHOz/rRYfZzSqVvmKmBTKdi+/zOsl3+nSg1bicyz8=; b=jp0GUFxlH/xpjju0oQWzeiNhM
	0woi6/4Borf2PVNf56HzZ3FzUPY1NdeTBqMFFhR+pMeU1Dg5198tdeUa3nIw6oCzl9YockRFqx3IA
	+2+xvyBEpEiIBZ5jmXaNTm15+p4MKxgsA2FBhIk5iaCB2kUS+di9cK+PLZ5Cc5282yAn8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQHfm-0006tQ-OI; Wed, 07 Oct 2020 22:12:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kQHfh-0006sn-4p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 22:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+V7sZxEf6mQQioi6/3fm4YR6csX1PamPT+xsX7pNB4w=; b=B+tvBJ21ftazSe6FLR9clZL9Gu
 v5eQ4/H8GPUkjGe3FXjkgFRHatQ6sb5XCwxzuBkVdxHaZn8oDKIe6o60/UAIV4A/eWWTrd4kyvAGf
 xH6rffoihHkiKjvFIy51P/BVbVQUQwRWbVY62XQMXVfuWw3C0faKMvgInvXok2uSDHH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+V7sZxEf6mQQioi6/3fm4YR6csX1PamPT+xsX7pNB4w=; b=dIqXnu3vIlzdtOolzGn1dWIKuS
 XSHIwtu5Yo4eqo06CmaKYIfxkyvQBahkaEtaiafIXrVPQfTzLI2OsapwcoVnTOPkbHl3a15ClENaP
 L6q1vq3lKkWTLxwT7FHoJRiqwjHQ9887WlU7fIHnXMk2UkERnufUU7XTfXMCC8ak4YBw=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kQHfe-002WJ5-C1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 22:12:29 +0000
Received: by mail-io1-f68.google.com with SMTP id l8so4140326ioh.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Oct 2020 15:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+V7sZxEf6mQQioi6/3fm4YR6csX1PamPT+xsX7pNB4w=;
 b=ep50T10dpOtQ6OLVV05z3OtJ/y5qq6xfZST1mEKfChwtiRhcO3i/N4I2jdp9MNovJk
 pCKOd/eZwaZnV2KWv1TUqBmy/Gu3YCAdmn2W/P9tqvR4EIUmxSfRR6oCT2+UptOCoxYz
 osAjjmkEmMm2ID+cJZ0TEfmtLYQNdpmmgQWnYXDtNwOxdB1HwOy81zc8y87p/ql4aEtl
 rungVNTAaNvn1+j6w2VrV74FMWuiEcg/Ls9u87zllfaWoUrX3uD8c/ssBHk0n6iMSXZf
 YFqgZdHZe4pPhylbuYcrd9eAzzNaQKbFJKRMvAJcT1fwFcThuz2o76vhh/JvTLhtvJ97
 Bt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+V7sZxEf6mQQioi6/3fm4YR6csX1PamPT+xsX7pNB4w=;
 b=qul67QaHDWJKJ0YZup15tFlvRl/LeUGpwUDltPx+u6pfShyhgy7Cjjkg65PzavpirM
 LsWJl5N2W2r4a2CFJ1YNJK/6n6sHQwQM+1rxMQKcaKW2ZeJ4GNXWrToGwXoZ8ZnQonLn
 Nfk/57obtZuyg83UXTKlu6KVOeLx3sEVKUSCH4rT2hmtaVT1DO79XwXW3uYZmK2Q+hSG
 iWMrHRu4iyLxkB2FaTiKOMBXcOO3ICcMPTf5tWt4HbuIs/38TibkSRm1K23SMdzfl6ZD
 gLzGNHOmkOHW5rRHokyFcAZjEk6zJh/4dbdTttSR4YB0fvMh5wKfCu0+YtfZhnDRuyjs
 7sBg==
X-Gm-Message-State: AOAM531vF3j8SvVpENoKFk3lB1+x/eE1x+BMxI0oc20aC0bx0mZzSjnn
 vO/VEMNwjIJXQ9zhQcTXpxWGIiX4ZgazZw==
X-Google-Smtp-Source: ABdhPJys6F86XrljUH8qz8gcZargaIbvBEZ19MwlhxtUE/XlZ7tHjdwI5A2a2e1IHecb/WpyiWo9OQ==
X-Received: by 2002:a63:4c4e:: with SMTP id m14mr4441454pgl.199.1602108304796; 
 Wed, 07 Oct 2020 15:05:04 -0700 (PDT)
Received: from google.com (154.137.233.35.bc.googleusercontent.com.
 [35.233.137.154])
 by smtp.gmail.com with ESMTPSA id n67sm4425110pgn.14.2020.10.07.15.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 15:05:03 -0700 (PDT)
Date: Wed, 7 Oct 2020 22:05:00 +0000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201007220500.GA2544297@google.com>
References: <20201005073606.1949772-1-satyat@google.com>
 <20201007210040.GB1530638@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007210040.GB1530638@gmail.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kQHfe-002WJ5-C1
Subject: Re: [f2fs-dev] [PATCH 0/3] add support for metadata encryption to
 F2FS
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 07, 2020 at 02:00:40PM -0700, Eric Biggers wrote:
> On Mon, Oct 05, 2020 at 07:36:03AM +0000, Satya Tangirala wrote:
> > This patch series adds support for metadata encryption to F2FS using
> > blk-crypto.
> 
> This patch series needs more explanation about what "metadata encryption" is,
> why people will want to use it (as opposed to either not using it, or using
> fscrypt + dm-crypt instead), and why this is the best implementation of it.
> 
Sure, I'll add that in the next version
> > Patch 2 introduces some functions to fscrypt that help filesystems perform
> > metadata encryption. Any filesystem that wants to use metadata encryption
> > can call fscrypt_setup_metadata_encryption() with the super_block of the
> > filesystem, the encryption algorithm and the descriptor of the encryption
> > key. The descriptor is looked up in the logon keyring of the current
> > session with "fscrypt:" as the prefix of the descriptor.
> 
> I notice this is missing the step I suggested to include the metadata encryption
> key in the HKDF application-specific info string when deriving subkeys from the
> fscrypt master keys.
> 
> The same effect could also be achieved by adding an additional level to the key
> hierarchy: each HKDF key would be derived from a fscrypt master key and the
> metadata encryption key.
> 
> We need one of those, to guarantee that the file contents encryption is at least
> as strong as the "metadata encryption".
>
Yes - I didn't get around to that in the first version, but I'll add
that too in the next version. I was going to go with the first approach
before I saw your comment - is there one method you'd recommend going
with over the other?
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
