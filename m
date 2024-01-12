Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D4982C0F7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 14:40:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOHls-0007os-EO;
	Fri, 12 Jan 2024 13:40:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1rOHlq-0007of-W8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 13:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eR00AhH+shlrnUBx0ovB0jfbN1lij8ctFTdOSWKfP3g=; b=KbEQiv0Izp8kNh7KG6+RXzVYM/
 O4ok60mgtQClP5Ni5E1eyqLv9gq7bKmB+jKOlQG79vn9kxcZo0TpJPkZe0IbYQyCZZmyUkIX4M2Rv
 g0ruxrDaegThuHWBUcGxKKFNC1s3qVt44no97DqodCgeiOgTTET6IQtSnQrLp7OQvdDs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eR00AhH+shlrnUBx0ovB0jfbN1lij8ctFTdOSWKfP3g=; b=DpNWzlPUiiyM2WCk7AOFkPmfTI
 q1L908EL5y0eMAhuY7neNsIanE3EPhcs0BUQyZCCNdPeMiXN48/Rb0SGd2Z7eJB00vbDeQ4rFr3pW
 PPMjo9+z2dKuKcTcN579AIHi26f7K1sVlOm6eGo91+UCDrssJgKFk/A+FVxpy+fPeaLc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOHlk-0006lS-LB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 13:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705066809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eR00AhH+shlrnUBx0ovB0jfbN1lij8ctFTdOSWKfP3g=;
 b=B6lnypHfY9QYsRu/3ShMvDzFhmGsVA4g5H8F+zCFAm1okfGMmd0jgEDaXVL8Yqgb9OlZOP
 aJaFqRtS6+quksnRBy3t1J6DPKUqJL32u66fb3m0h+qnUML8sb2DyK+1viuAnRrEuR0NJD
 zHmJBfWsm3rypf1kTRy5a5zXQ2sbE60=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-ftMdFY1tPjy5WXrZiCZo2Q-1; Fri, 12 Jan 2024 08:40:03 -0500
X-MC-Unique: ftMdFY1tPjy5WXrZiCZo2Q-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6df2f0e8351so1945624a34.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jan 2024 05:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705066802; x=1705671602;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eR00AhH+shlrnUBx0ovB0jfbN1lij8ctFTdOSWKfP3g=;
 b=m5f/SQ5okpQZyuvcdUGrXL5MTM1nM8HARWY3MuDLsw8eXCSLJeoVw1ynuCUKXKEB5Q
 e/OnlJwXZzj93yE0+DxQ3fEw4QafIJ3yYJm+DKKBmvAZNHipBisS6hkcVIt/6M5l6yp7
 yhT8YOBk0upAIvThClXeivcrXn52sKI3LPyKB3vB4N5ANGpiNVAhl5ugN1B48U2PP5jA
 Ch+Z1uXZ8Y836NqL8EcTjHspmR5zorDCRSdlEQs2n8xpQ1Gp3E/G9uQ0AK45SjKe6Qe9
 pjHbQTG4idktb9hmVZq94qmoSt9XGrOQvMlowvwO9HU0pHT3QVgP+H5XMTrnuN8Wd/L2
 RgwQ==
X-Gm-Message-State: AOJu0YwHXxoeTAmes7uMjpXaWIiYc4HJur0brkzNFp7UDQO9cZiED9nM
 VG8Oaana+mN0IaEjpijm4tiJ1V8erazm4GU+qCJZ9bgj+cYasNm04EHZ9lW1fspSWKbU0bsN7j+
 1IgCKlGCzSGnf+ILX++433c+A48q3j4PMR7baylIHOkNazA==
X-Received: by 2002:a05:6358:c3a3:b0:175:960c:17c7 with SMTP id
 fl35-20020a056358c3a300b00175960c17c7mr1076958rwb.14.1705066802552; 
 Fri, 12 Jan 2024 05:40:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjTs44cWJcLcvET0ZZbx8OE1urr2qihH9EWh/Ho3cygsX8/+2sPzpweq4nclludGIUCKaQqg==
X-Received: by 2002:a05:6358:c3a3:b0:175:960c:17c7 with SMTP id
 fl35-20020a056358c3a300b00175960c17c7mr1076952rwb.14.1705066802231; 
 Fri, 12 Jan 2024 05:40:02 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 y11-20020aa7804b000000b006db313c0db8sm3270855pfm.92.2024.01.12.05.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 05:40:01 -0800 (PST)
Date: Fri, 12 Jan 2024 21:39:58 +0800
From: Zorro Lang <zlang@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20240112133958.pgxs3gl33g5hf7pn@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20231121223909.4617-1-ebiggers@kernel.org>
 <20240111035444.GA3453@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20240111035444.GA3453@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 10, 2024 at 07:54:44PM -0800, Eric Biggers wrote:
 > On Tue, Nov 21, 2023 at 02:39:05PM -0800, Eric Biggers wrote: > > This
 series adds a test that verifies the on-disk format of encrypted [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOHlk-0006lS-LB
Subject: Re: [f2fs-dev] [PATCH v2 0/4] xfstests: test custom crypto data
 unit size
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
Cc: Zorro Lang <zlang@kernel.org>, Daniel Rosenberg <drosen@google.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 10, 2024 at 07:54:44PM -0800, Eric Biggers wrote:
> On Tue, Nov 21, 2023 at 02:39:05PM -0800, Eric Biggers wrote:
> > This series adds a test that verifies the on-disk format of encrypted
> > files that use a crypto data unit size that differs from the filesystem
> > block size.  This tests the functionality that was introduced in Linux
> > 6.7 by kernel commit 5b1188847180 ("fscrypt: support crypto data unit
> > size less than filesystem block size").
> 
> Hi Zorro, can you consider applying this series?  It's been out for review for
> 3 months, so I don't think reviews are going to come in.  The prerequisite
> xfsprogs patch is already present on the for-next branch of xfsprogs.

Sure Eric, I thought about this patchset last week, I saw that xfsprogs
patchset has been merge. I'll give this patchset a basic test, to make
sure it won't break xfstests, then merge it.

Thanks, and sorry this late.
Zorro

> 
> Thanks!
> 
> - Eric
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
