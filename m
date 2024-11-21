Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 811379D4F7C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 16:11:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tE8qD-0003Rz-1x;
	Thu, 21 Nov 2024 15:11:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tE8q8-0003Rr-BV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 15:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wEP5JUiaMA/IF35vsNkpSw7Oz4wriLxSoUjTCI/f4qc=; b=Oz2Fe3IT9cC7rQnAcCNQ/LpaPa
 /tFjTD0lQuhJ/HwhCw5on2cUBrKVq9oPfjxYjhjrHjY5IdjVenLg5tTmNcQsSKuSIQNBnLfGZWXyZ
 0xxAURrT2+Cj4QKXzud5nYdhaUOln8nZgaRU0FCgPAAkSzwTJEB94N1n/8cx1UHFXd5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wEP5JUiaMA/IF35vsNkpSw7Oz4wriLxSoUjTCI/f4qc=; b=iV6HGBE9apP/yeG9QCftnnFarJ
 GH9KvQpbZqdBveAC3ZlyVizpUSeysvH/VKKdZAELSlDVqh+yLKvb9CRXIoYxU/O7OXbuaUK1HHD9U
 blsZ/ACLY9kEZt2VdFB3NwceB+L/c+6nsM2bLujlUo6I4Z+782RATiH0N+LuyPHH/4CY=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tE8q6-00071I-Fp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 15:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732201880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wEP5JUiaMA/IF35vsNkpSw7Oz4wriLxSoUjTCI/f4qc=;
 b=jVT/Y3UOvlZ+w8BTUGa7h/R8H/HPc64SSit7FAcVTm/PCmFzHNBGvMX+b7FKjO/sIkMMO8
 rXKF4UculJ5ouhPT0i2BRdy0jSMS8SNQBSmQtpITbfz2FxYmOCZSKPf0LcK00Ij8nGxCpB
 TWfDpR48lhMPDbCi1l30hh0pGYu9aG0=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-1ovUc-uaOUycIvyNkPXM-Q-1; Thu, 21 Nov 2024 10:11:18 -0500
X-MC-Unique: 1ovUc-uaOUycIvyNkPXM-Q-1
X-Mimecast-MFC-AGG-ID: 1ovUc-uaOUycIvyNkPXM-Q
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3a76ba215b2so10130505ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Nov 2024 07:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732201878; x=1732806678;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wEP5JUiaMA/IF35vsNkpSw7Oz4wriLxSoUjTCI/f4qc=;
 b=qcocrmL2/9pcDf7AcW4FnryPdmUtB6gQsSa6Nv9AufXYHvuXRgAynYRhfruxkrGcGf
 KMd3vuFdkBRSmRJxMnq1svVNolIzAUGTWYldMyjPxMdXlmyGuo4zHoSTegayjG40RXDx
 2uVPSgSyu+NTkJmTeWS0R/eiIGiracgFXL9de4Eff74+KpgVCDzzcKPUA6gN0Z7CJ+2g
 EUkhgFTQBqg00EiZaDmsoigOAwIB80qq9XRtnJ8+y2xj0kTBDOQCV4WfJECq6vLmpfGE
 DIBFLp8k1CJdUD4cIOnyq8O/fmL7qxQFWIduxCuWpLt6zDuAAkl3nQ6QCu7u1FbuTPux
 3O+Q==
X-Gm-Message-State: AOJu0YxtbjhyRoMKVy2/r9CbHOHiHDBUKZ6UtMtAvQpf5GGKPMM+NLKf
 Car9TP/PU+O7WmtzY6f+qGHT+N1k+KsZ9W0wL+AlRKfuOKr1awg9x4OMHg0dl+55/54A7yqZzH8
 lMOUAfUTioFhiXW3MXMoGUea7I7dkFCqtfVj+Kap8W/bhI5C8/3ofzmb8wD5WmMI1NEUfSWt779
 c=
X-Gm-Gg: ASbGncuO+fDfzq6lxpnP/ObIac5bs8Fjr92tUQE4o8a7d0kElA8EwSDQl+eyR5AgLMu
 gAyesY8d/W7ARVxrRwvtb/sysBV2ik6bp4ffFQXXjuDjQKLPKtWwbPoLE9i9NeitfcZEql8h9GX
 0XFM9ovUId517j0H6o0fyAeX5wadxu/R/cQR5qT/gLnEhi+yuIX1O4qFsX7q25YGBFjz9Tluy99
 6mx5gotnrG3tHeTVUmQLCM0X8gnxJkLbBNcZMknxqrB7ShqPt5XEFtyJQ==
X-Received: by 2002:a05:6e02:164f:b0:3a7:832e:8c3b with SMTP id
 e9e14a558f8ab-3a78644bf9cmr78708465ab.6.1732201878046; 
 Thu, 21 Nov 2024 07:11:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWKi5n4fxikKaqR/6RWUxs6rHRDv81IGLKrOAuQCiwlCLjjCp4628PvrKNDVnxSmqdTjPl/g==
X-Received: by 2002:a05:6e02:164f:b0:3a7:832e:8c3b with SMTP id
 e9e14a558f8ab-3a78644bf9cmr78708215ab.6.1732201877758; 
 Thu, 21 Nov 2024 07:11:17 -0800 (PST)
Received: from [10.0.0.71] ([65.128.99.169]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e06d6ead51sm3806448173.12.2024.11.21.07.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 07:11:17 -0800 (PST)
Message-ID: <8b2212c6-2c11-4b9b-b8be-61c6ffb6d94b@redhat.com>
Date: Thu, 21 Nov 2024 09:11:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20241112010820.2788822-1-jaegeuk@kernel.org>
 <ZzPLELITeOeBsYdi@google.com>
 <493ce255-efcd-48af-ad7f-6e421cc04f1c@redhat.com>
 <ee341ea4-904c-4885-bf8d-8111f9e416b5@redhat.com>
 <Zz5I2cdFn331_0ud@google.com>
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <Zz5I2cdFn331_0ud@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ceHjy4kshFagkZquwjEEbuZ5VbFpm3LzH9mj37JOW40_1732201878
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/20/24 2:38 PM, Jaegeuk Kim wrote: > On 11/20,
 Eric Sandeen
 wrote: ... >> (Note that f2fs is the only filesystem that attempts to handle
 lazytime within >> the filesystem itself): >> >> [linux]# grep -r \"lazytime\"
 fs/*/ >> fs/f2fs/super.c: {Opt_lazytime, "lazytime"}, > [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tE8q6-00071I-Fp
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: remove unreachable lazytime
 mount option parsing"
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/20/24 2:38 PM, Jaegeuk Kim wrote:
> On 11/20, Eric Sandeen wrote:

...

>> (Note that f2fs is the only filesystem that attempts to handle lazytime within
>> the filesystem itself):
>>
>> [linux]# grep -r \"lazytime\" fs/*/
>> fs/f2fs/super.c:	{Opt_lazytime, "lazytime"},
>> [linux]#
>>
>> I'm not entirely sure how to untangle all this, but regressions are not acceptable,
>> so please revert my commit for now.
> 
> Thanks for the explanation. At a glance, I thought it's caused that f2fs doesn't
> implement fs_context_operations. We'll take a look at how to support it.

(cc: list trimmed)

I had thought the conversion would resolve this too, but had not considered direct
mount(2) calls passing the string in, which is something that probably needs to be
supported even after the conversion, sadly.

As a reminder, this might be a start / sketch of how to convert to the new mount API:

https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git/log/?h=f2fs-mount-api

It's not entirely correct, but at least the first several patches are probably the right
idea - getting sb / sbi out of the parsing path, and deferring option-vs-disk-feature
checks until after the superblock is read, etc.

The final patch is probably not the way to go - it allocates an entire f2fs_sb_info
in f2fs_init_fs_context - it probably makes more sense to create a new context
structure which holds only mount options, which is then transferred into the
sbi after option parsing during mount or remount.

I was doing these conversions as a side project, and given the f2fs conversion
complexity, I have yet to get to a series that I'm happy with. Perhaps expert
eyes can help!

Thanks,
-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
