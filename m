Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E85984E1F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Sep 2024 00:50:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1stEMP-0003dz-J1;
	Tue, 24 Sep 2024 22:50:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1stEMN-0003dq-Ri
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 22:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WesIl88BNTW+mHmunHUki38RltYdnZpJB4vIfDMtZWI=; b=JT4+/XOYaCQn7qBz33mNfZNlnb
 PP7I+tAaDa8Kt+vF43/6lJXOKibvf7nJ5V3hr7bRnP9rpcMTRQCVNaJ8Sqlbg76OTD2Uky+zRXvcX
 PObs2AtNneN3VvdPskaiCuO4hefyW2l7sIg7uZEYHOSdhYPYD87fLjlcX0SiMDMTj8lo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WesIl88BNTW+mHmunHUki38RltYdnZpJB4vIfDMtZWI=; b=dRsFNNAzE7RFaBCBkFgeVz5rJE
 3bqXgtjiuOhtExD9SvAMi60tRElNKDMW/n2Q6n+SRaZv+4GrSLPp7+kMZ2NV2aT1/FjI8l6ZQ6DOi
 zqof5vDo9PJ8uyWVTDYZeY2GJ211aW+CQoZ8qsp4UYOBp+7aGqMqFx38oDI21Vvhm1bY=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1stEMM-0004pm-FZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 22:50:19 +0000
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5c5b954c359so4223931a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Sep 2024 15:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1727218207; x=1727823007;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WesIl88BNTW+mHmunHUki38RltYdnZpJB4vIfDMtZWI=;
 b=KdrflWkQveADBEFmJFI6H2rHLqEaISqVzuvjd00WkMSGYp1QGEjZJeT0Py2FZKdOlM
 mo2R0Ofb/yahJ3USIeGd9QRTX0026Ez7HIu8EKIoCgeEmsqG/3h29/izAkXbOvKB3FI1
 CZItK/GDDjCR92YO/t/fQXqGCaY2Q9+k9Qn5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727218207; x=1727823007;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WesIl88BNTW+mHmunHUki38RltYdnZpJB4vIfDMtZWI=;
 b=a2qBoIHHm0K+D1klpRza2+U6JEajl7Qm35AhKeTHu2LXWykFkyf6IMxYp0J30FmS+Y
 5Zqaak0dGStlZ8OOFEM76QVoh4sIxCbQLRzxJwYWH/IOqRzHlojbst7WL0OebTX6njAT
 fEUmnQc5a2tSOcdlwIXVZG1eWgbSY/X0bG89AEyp9/rFkh0k1t/HPphJGj9ph/qQxRfh
 svTSU0L3h3zm7TNX5OsXAGSqNAlGQlDVxVtOnuV3xu3qNFdQvv1G3SAOsHEVLS2Yeq7f
 f2FLnKawDBuLvB66t5+5JNHp5nqHUkNWG3h3SKRam5nkpOBOz7VH/RrbqpsStmeZgifs
 gbPg==
X-Gm-Message-State: AOJu0YxJNp0VrqV4mYdsFVbQMqMKLb+s/p99UO6UAyfSl3gjGiY7J4G/
 eRIdq8bjEhO5TizeC/ONcZo4nt5DUus5enV1htPsV2ZK+Lc6VZPshlY0aWgVjQHl/qQiv/BAB7l
 7p3Rk5w==
X-Google-Smtp-Source: AGHT+IEmSIGPMd4vt8e1mDFeFXNp0j572bJ3GfINcIEH3RpjDCyST1R/lfCUMzphtF3rJIHAmM7xWQ==
X-Received: by 2002:a17:907:868d:b0:a7d:a00a:a9fe with SMTP id
 a640c23a62f3a-a93a038400amr57276266b.17.1727216704336; 
 Tue, 24 Sep 2024 15:25:04 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93931347e4sm138738966b.194.2024.09.24.15.25.03
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 15:25:04 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so893850266b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Sep 2024 15:25:03 -0700 (PDT)
X-Received: by 2002:a17:906:dc95:b0:a86:81b8:543f with SMTP id
 a640c23a62f3a-a93a06c61ffmr54421566b.64.1727216702945; Tue, 24 Sep 2024
 15:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <ZvInHczHWvWeXEoF@google.com>
In-Reply-To: <ZvInHczHWvWeXEoF@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Sep 2024 15:24:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=dvXyr8b5Z1cYLa-A=-JpYVpJ854UMvftE2gaK==GMg@mail.gmail.com>
Message-ID: <CAHk-=wi=dvXyr8b5Z1cYLa-A=-JpYVpJ854UMvftE2gaK==GMg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 23 Sept 2024 at 19:42,
 Jaegeuk Kim <jaegeuk@kernel.org>
 wrote: > > In this series, the main changes include 1) converting major IO
 paths to use > folio, and 2) adding various knobs to control [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.43 listed in list.dnswl.org]
 -0.9 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1stEMM-0004pm-FZ
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 6.12-rc1
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 23 Sept 2024 at 19:42, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> In this series, the main changes include 1) converting major IO paths to use
> folio, and 2) adding various knobs to control GC more flexibly for Zoned
> devices.

Hmm. I get mostly the same merge result as in linux-next, but I did
end up with a difference in f2fs_write_begin(). You might want to
check that out.

That said, the difference is a PAGE_SIZE vs folio_size(folio), and I
think in the end it doesn't matter because I don't think f2fs does
large folios yet.

But please check it regardless.

             Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
