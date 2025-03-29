Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D33AA75421
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Mar 2025 05:19:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tyNf9-0000PJ-DT;
	Sat, 29 Mar 2025 04:19:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tyNf8-0000P7-GI
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Mar 2025 04:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XWQvQV6eLCqyLjpmpylUTD4PAH8zIsvBt17CMqdmDc8=; b=NnsQmXwswiynxDWsLG8ZWQ+FDs
 CFHn7X/4UdbqngSfoD32OaQ5X4gt3PgBQdb06P9aIbEKe+R4K5WbiIp4XuWu5UF7o4bNfTrGHXLXr
 ODoi4MAFSTX0a3FV2HSM63JmPHxZdN7Uj46qtUugZ9OMEqxkQdOq/VsLv5SsNWChdpgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XWQvQV6eLCqyLjpmpylUTD4PAH8zIsvBt17CMqdmDc8=; b=khQgZP1cwuggUK+TMaaKEopfGh
 MxAQLiKYG8tNZzODQIVzs3iDnWxkBGtbUHoxEQ1KYq9vXmxLu3q4TFfVNO31BqiwUyn/Hh55/JFbL
 hjktRZUqvlEugHJtZG68taJzzPYEaauCRqkmQts/N6J2TY/gf01hap0YAn4D9z2s9Elk=;
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tyNf8-0002UL-Aa for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Mar 2025 04:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743221943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWQvQV6eLCqyLjpmpylUTD4PAH8zIsvBt17CMqdmDc8=;
 b=WPmwV6fScu60eB9IqalQcc7hpofwt2Tp8cNeDUspowp/0w/5ygVhsWy9AMK6FsRTBp/VTL
 AZ5jmm+/A3+Y18EyLdttt4wkRj2Dgd5RUvA+UGPRRmvuhhXMfUCt11tAiinmlc2QsdnKVK
 zLH+h6WhESfVngkqq+NSLjPCaF2GKS0=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-fGc9M1vwPQio71Gy77wS2w-1; Sat, 29 Mar 2025 00:19:01 -0400
X-MC-Unique: fGc9M1vwPQio71Gy77wS2w-1
X-Mimecast-MFC-AGG-ID: fGc9M1vwPQio71Gy77wS2w_1743221941
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-85b41b906b3so286839339f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Mar 2025 21:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743221940; x=1743826740;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XWQvQV6eLCqyLjpmpylUTD4PAH8zIsvBt17CMqdmDc8=;
 b=j3hYEtfcWswfosRn+OAzH0QMNhOhvxTYqC1EIQJyu/H4DayOhoiRX2GsuqMi4fSpV3
 50kVxsRWhtKR1EAUIfFLwDW9gyFr6txqIa09P/c7njmy+M5tzBZM7zaB2PnREdwl2BKb
 Mtb9nA6rQOYGV1xMI2LwYiNVkwOF6l+D5/zU+I94JsQkTRQ3u5WOyljtVHJMfnKthEYE
 P6WjI+LqrOofWTFPDGk7OBs9IjubwexdovJF5qFAMBwx9RG99UABt3x4b+p7EG5Uw/W+
 qcM6gs0zUwnukt8nNuPjOFxy/1JE0ECzpL1+b7F4jrLrCGanTziqSbjWAelWCn39ixW+
 Q/rA==
X-Gm-Message-State: AOJu0Yxuak+d/jZyXwGhi9UPraQI/zm3QyWAx47ygOAVb79dGgF6G8F8
 Nh7h9SRUYB75nffv/j5jjRdV3gIvk5fQCp3YBrkSVBTEsAnHFyMaKRgRUwpjRj43s7xnFhO68s7
 lBlXg1Mky5NIEgtTks87WXNFgi1GfHqQh8taBnIPFcu3FKojkC3GNgJlGDOeBObo1pMtT4ka36m
 IDYS1rN2gcl6nc1d48+WaZRVpCo8oxqn+bFdAyJ3sQnGeb6kpzkZwuR5GUsXoa
X-Gm-Gg: ASbGnctNfSO1rLJ/izT34He6vsYSA183S93y5r8zbCa2flyBpkXmdeO8xkkRHATbMPy
 51tpoJFOS0thkqmzDAhdNQM+zczK4JTNbNvDQEecphMm2TpyEsC8+rU4KdKzAs15yAGcdxDlXE9
 meQIarhWuVmw6YdvbDyou9vygCHKeOFyhzLTdKtMY6Avxa+BYe2rUaVGMWBW2MIvSmDGCtLPFQv
 zpA5ME0w6Flc0eFxeXD22H05guk1OAODZZfHmuK5NSEEyY62caZ8/BzOvYv
X-Received: by 2002:a05:6602:4c0c:b0:85b:3407:c8c with SMTP id
 ca18e2360f4ac-85e9e90e27fmr148522539f.11.1743221940389; 
 Fri, 28 Mar 2025 21:19:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGExIoKizic94Ep1259b4ThI1RryrGjFo02dROR3SQhmOwxnksfA9R27oGyVQxnvaNrC8Xuog==
X-Received: by 2002:a05:6602:4c0c:b0:85b:3407:c8c with SMTP id
 ca18e2360f4ac-85e9e90e27fmr148521139f.11.1743221939876; 
 Fri, 28 Mar 2025 21:18:59 -0700 (PDT)
Received: from [172.19.1.92] ([99.196.128.57])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f46470f04csm757817173.23.2025.03.28.21.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 21:18:59 -0700 (PDT)
Message-ID: <79090775-413e-437e-ab07-ac6965932a32@redhat.com>
Date: Sat, 29 Mar 2025 00:18:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
In-Reply-To: <20250303172127.298602-1-sandeen@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8WFOluzvDnDZFjzy2zbJn2y7CsiijvPHNyT3O2Z1Mk4_1743221941
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I was working on next steps for this, and I have a followup
 question. Today, several mount options are simply ignored if the on-disk
 format does not support them. For example: case Opt_compress_mode: if
 (!f2fs_sb_has_compression(sbi))
 { f2fs_info(sbi, "Image doesn't support compression"); break;
 } name = match_strdup(&args[0]); 
 if (!name) return -ENOMEM; if (!strcmp(name, [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tyNf8-0002UL-Aa
Subject: Re: [f2fs-dev] [PATCH 0/9] f2fs: first steps towards mount API
 conversion
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I was working on next steps for this, and I have a followup question.

Today, several mount options are simply ignored if the on-disk format
does not support them. For example:

                case Opt_compress_mode:
                        if (!f2fs_sb_has_compression(sbi)) {
                                f2fs_info(sbi, "Image doesn't support compression");
                                break;
                        }
                        name = match_strdup(&args[0]);
                        if (!name)
                                return -ENOMEM;
                        if (!strcmp(name, "fs")) {
                                F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
                        } else if (!strcmp(name, "user")) {
                                F2FS_OPTION(sbi).compress_mode = COMPR_MODE_USER;
                        } else {
                                kfree(name);
                                return -EINVAL;
                        }
                        kfree(name);
                        break;

so if f2fs_sb_has_compression() is not true, then the option is ignored without
any validation.

in other words, "mount -o compress_mode=nope ..." will succeed if the feature
is disabled on the filesystem.

If I move the f2fs_sb_has_compression() check to later for the new mount API,
then "mount -o compress_mode=nope ..."  will start failing for all images. Is
this acceptable? It seems wise to reject invalid options rather than ignore them,
even if they are incompatible with the format, but this would be a behavior
change.

The above would be simple enough to defer (maybe set to COMPR_MODE_INVAL and
reject it later) but I think other options such as compress/nocompress extensions
would be very messy to approach as "accept all options given during parsing,
and validate them later only if the corresponding feature is present."

So I wonder if a behavior change (stricter option validation) would be
acceptable here?

Thanks,
-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
