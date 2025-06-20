Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FEBAE1D52
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jun 2025 16:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXIvkvKoWVR25ehbEG9lDYrvBbjP99FZrHCmrdXtbok=; b=VTkNBCTa/6s3gpLnLcyTo+pt6v
	CcBgm6hjn/MFMQm+gXVHMNTCszUu5TRprixX+eV6GtTWPnD8YMJogKi5VOBtZ6FhQOZIjQ9IkNqKH
	cbsrWKOEiQGAYU0tJl634+MvUfRrEs0Fer7/U5Lj1hPIDiWAYWx9RFypZU54iUj6JSoM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uScjX-0008F8-Bb;
	Fri, 20 Jun 2025 14:28:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1uScjV-0008Ez-La
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jun 2025 14:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ucWMOo5W4QYO6Mg122vHo8guICWeoYajSNvWPSEp3M=; b=XFmeeGXZzcH4aFQIH4+s0qpm7q
 gaUcCzFUu/fVM7KSZ6I1X7WLy5GQDaR+rJZyyH5tmPmK/6KwPTYcrz33BLtbzwn/EcOyo3uf//lKx
 lK2bDjCv5Rhq2oNTL3UCyOZ6Cyo60nOlk2VLDxrgr3OEvEQDsZluGNysfHFxRB/vNhLs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ucWMOo5W4QYO6Mg122vHo8guICWeoYajSNvWPSEp3M=; b=QmtGJnC7Bah3EyFRuqlR+Z//Ay
 mCMd88k/YByWHcmAGpflHlVr+v+/XsXkMRrpjOJrE6eFHoWaHP7Rk3aiX39/liwbI+k/xgLmU9k0g
 ph6+ncrPMTe3tSpATbYtXii+YQRO8dhsg/yLoegE5QcHsw38vUS+mYMeexjbmNZeSiHI=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uScjV-0000qc-8Y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jun 2025 14:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750429713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ucWMOo5W4QYO6Mg122vHo8guICWeoYajSNvWPSEp3M=;
 b=KP3Vsp0YU0loUqtCny6fEYEn6fk24KG9ZcOlltikLRhTHO3vQjSUdUaH6yRilMQ9A7tYrX
 v6gxxyB1JEMXMpWhGFjlnMfviyGdQshawuTTPpXw8XtgpbTceudP8ZSOgtFnKvlp4GyE/D
 orvc+yOo3ZRmw1gHh6FoL7aMncSO/os=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-hxZaVAbiOo2zkQgLaozUIA-1; Fri, 20 Jun 2025 10:28:32 -0400
X-MC-Unique: hxZaVAbiOo2zkQgLaozUIA-1
X-Mimecast-MFC-AGG-ID: hxZaVAbiOo2zkQgLaozUIA_1750429711
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7394772635dso1518694b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Jun 2025 07:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750429711; x=1751034511;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ucWMOo5W4QYO6Mg122vHo8guICWeoYajSNvWPSEp3M=;
 b=ospq2R6IoopyELliyTDBsRZfLCsmnw0apRO4OewgzFvtbiWczagiUP6RXARtb2F7qE
 +bsm2aQMAm7/KTsPE+TP1MrSBa9t9KRYQBNG+88AYVWVxzrWJGLbtPJBSEw2KlS/Uw/T
 OcuhmS38vmZxgH2qFhAQQLmFv/Bk2GrdgpwSDjp8lP0eo4GQLWadNawa0C0u85tHEPkP
 O16djmqGHCoLJJSJx8wU+ONi4M77oIm099j73h41ukbiw9XManozXKqfRgeD3Ig6bRYG
 vK9MegVlG1FFQHnxe8EbZL1bwKraHqW+SfoFjftte4ZLRTj7nStL+InCIiCHsBtO/I7g
 fzrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJAZFws9wU/yuFDDEPVheJxmqVYEmzNwZLuKsfKbtLwP5UwQYIaHd/fJbQd4YhC4daJ0sFWXBFVJHcZZ3mzXMs@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz/JTNNp3dC0mnXj5lkNbks73dIU6EH3Yo84BPPzPPIZ8sKTWtf
 cwoyQyZBiwH7db/66WKoNO56GR6H3FSu5ygfStU5vOxMgi803LVNVeAavSszHxTg//Z5qHdvbtF
 9bTUsD/SJ9LSsRA7xo/9hvzbjHoKJqNS0XBFNXg9voJj8f52D5NjisE6ImQjxnEXwHBIaxRnuC8
 dDdVU=
X-Gm-Gg: ASbGncvB0/LwtB1S970/iF4FDuVhSxz41TSqkXLLlUXdnTXNgMOBmPkXbLs7NVjq+li
 vvqEsPX2nrnCe7w/csrfjD8P5hbFZ9NoUimFoMM+Y/z9AWDZItUwQH22Y26HqQss9fLcZAeqjzS
 RF7ZwWg6aez8mS9LXenZQOYDU74S41spRSKVpIkertVMkVc248YEKdcni4vc4VrUTPOpsHNjWHV
 w2LeHOKRWjRraLHv8C9QlWl/M74hjV2erZiMZ44Yws3vbd9YtX3EHuza5wAE4cIqBdkQs8doMOT
 bXVJrTkl6czU7oGYrTAONeHnHDsIwA4Dcj8P9VzzFlv5spWpp+iCJ+EMoX4tYfo=
X-Received: by 2002:aa7:88c3:0:b0:747:ab61:e4fa with SMTP id
 d2e1a72fcca58-7490da4a743mr4521607b3a.14.1750429711234; 
 Fri, 20 Jun 2025 07:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8AqXLFkwz0QSfwU9gX6l+H/B9X20dgZVbMCYNNJ+6/zgR9Um4zjBr3hKxT+ilWXhOO5Gfqg==
X-Received: by 2002:aa7:88c3:0:b0:747:ab61:e4fa with SMTP id
 d2e1a72fcca58-7490da4a743mr4521582b3a.14.1750429710906; 
 Fri, 20 Jun 2025 07:28:30 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a621ceasm2262963b3a.97.2025.06.20.07.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 07:28:30 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:28:25 +0800
To: Jan Prusakowski <jprusakowski@google.com>
Message-ID: <20250620142825.hczg4ldsk46delze@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250620082906.2122560-1-jprusakowski@google.com>
MIME-Version: 1.0
In-Reply-To: <20250620082906.2122560-1-jprusakowski@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UoPr5vk7o6t5rXme8fmeiDRwecSIImpNCR3NLWVw18M_1750429711
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 20, 2025 at 08:29:05AM +0000, Jan Prusakowski
 wrote: > Hi, > > We're testing F2FS internally and when we use a compressed
 file system we I saw you used _require_no_compress in your patch, but this
 function only supports btrfs checking currently. How do you avoid your test
 failure on F2FS? 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uScjV-0000qc-8Y
Subject: Re: [f2fs-dev] [PATCH v1 0/1] generic/018: do not run the test if a
 compressed filesystem is used
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@redhat.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 20, 2025 at 08:29:05AM +0000, Jan Prusakowski wrote:
> Hi,
> 
> We're testing F2FS internally and when we use a compressed file system we

I saw you used _require_no_compress in your patch, but this function only supports
btrfs checking currently. How do you avoid your test failure on F2FS?

And there're many fiemap related test cases, will they all fail on compressed fs?

Thanks,
Zorro

> see the test generic/018 fail consistently. It looks like this is due to
> fiemap not supporting compressed extents correctly:
> 
>     [...]
>     defrag /vdc/fragfile.9981 in region[0, 40960]
>     /vdc/fragfile.9981:
>         0: [0..31]: 2682968..2682999
>         1: [32..63]: 2682976..2683007
>         2: [64..79]: 2682984..2682999
>     Failed to adequately defragment file
> 
> We'd like to disable the test when the file system uses compression. Please
> check the following patch.
> 
> Please let me know your thoughts on this.
> 
> Kind regards,
> Jan
> 
> 
> Jan Prusakowski (1):
>   generic/018: do not run the test if a compressed filesystem is used
> 
>  tests/generic/018 | 2 ++
>  1 file changed, 2 insertions(+)
> 
> -- 
> 2.50.0.rc2.701.gf1e915cc24-goog
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
