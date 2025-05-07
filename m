Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40CAAE77D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 19:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwP27JAvuXzYf1sCy3JdCzMDKdw4i0xKZhY3K/X/GRM=; b=XxNrUuCHQMDnmINXShlPVK2A7P
	sWxihupe0xG/U0dkobzOOz63EadjEPHAk/QD3Ej1EqgB6NeLSmq0cCFzanrROD1QgbM6WHFtLbKNF
	MivT3yydddC3rtXdwM2vCfKlPDuay3TM1D9SYQ0k+eBmQNVfGYdpjaax41JwsieNlfZw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCiJY-00079C-L3;
	Wed, 07 May 2025 17:12:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uCiJV-000795-Sc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 17:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f5O2TqgpWxzRwP3QqeFI3cCUlhW/V+ugLYUrXf8tgEs=; b=fBHQB3HJ6UrX4Ehw9S1YUdHHFA
 lBTHu+ph3a8FKd8XbuFtXN31r1hcL3rXDd2A+GGNArImWG6rLdfMfvIYpoqt7BIG29+JUm2d8t/8i
 OAKy9WXkN/0NLRIangCriJpw2MUkNgVKTZWQ1jeDOsUlzwmCt1ENGu8XiyESTVHAUs/k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f5O2TqgpWxzRwP3QqeFI3cCUlhW/V+ugLYUrXf8tgEs=; b=cWHtLtyen381ofnbrw2fmsrnOI
 tkVcrJH6p3X2qsHeqGUCQu44ifKeKxjl4OrPhLGjKXKyMSXg45BCOac938eQZ/ffwPKfmM/d5/VOo
 C0bOpx+KIC6cFBEnbGBw0PDCLe0+h808G7ab1An9yaTcjTanjvhFcRRBj6Ke4JdNI/8Q=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCiJE-0003xk-6A for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 17:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746637900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5O2TqgpWxzRwP3QqeFI3cCUlhW/V+ugLYUrXf8tgEs=;
 b=AgJD2VMnDNs2V9iZGgmL4XqwIPWRTkN1XWcObSh1ZS2ovmrE0S57aeP8xZj+Cwrn1B4tqq
 J22xrpkeApJ6qwbY+oNf73OXeQ1X7bYlgOmTobaeDnUhSqsgcCDb4/w4W6xricPKXTmPpR
 8OFANr15Vv3yzT4QyNOg6COheFK/sMM=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-1hCb3kS-Pk6RnMSRKo00xw-1; Wed, 07 May 2025 13:11:39 -0400
X-MC-Unique: 1hCb3kS-Pk6RnMSRKo00xw-1
X-Mimecast-MFC-AGG-ID: 1hCb3kS-Pk6RnMSRKo00xw_1746637899
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-85b3888569bso15462539f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 May 2025 10:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746637899; x=1747242699;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f5O2TqgpWxzRwP3QqeFI3cCUlhW/V+ugLYUrXf8tgEs=;
 b=w5XTyn6WlEybu/jgqR/Wa+He9b7dhhabjyAsJlV9iPU2vvPNmOmzkNbHJUmpOEPHuE
 61B/ZI8b34r0t5fRr9cuDAEtcuk9OppSIdqRUQySFuvibaqfTa8ieOyTVVmohhsOvcwL
 cl6NQjr+4a3WIh3yu0znsErvAsSTttQG5tbWob8kp7swdBleocfKkJFKwVEBxJyH0pEa
 ChS8/sL7phQgIkHwHJb7sAepchUgvD6JhFy7DWD5sUjy3LQjhPJSKzbmi6D0qHpWhm6J
 JqmyoY8i7K/jeRikCqISlIkRDozEssLMwpRJYbnfgW4/UtRXkvENbRs61sn7L0bhB873
 ONLQ==
X-Gm-Message-State: AOJu0YwO1CxH3pGj9VojDnvlpQ8rw+Gq+9cKhd3bDG/Qsdk+Nmt0ZfHd
 jj38KcIaFixOk0KplAZZql9vkgE40Aqc1rJUb7//sdGD+nOjrJUQrmXUsGY11nY6O/D4zxvvngB
 wQx9cjigAh+4Yohywog/xaGu9JQJgJH+sbegLTurPG5gKrnG8bMpdmLIQ1NDnCI8sMIYxxpu85b
 Q=
X-Gm-Gg: ASbGncusI+2O8Tx5qiv3v9uQGRztTqYRyUZM7R8eOQukcqEGA0sdnbnJMsdEzJdFYnL
 APMqRw4LnDta9aS+UEoER3LnGbRv2PAtiGkNp3w31mkjez/L4QDeesxVmTercq+dDgYAItswruR
 9/+Np6+Vm2j/uoftx2OppvRAAfwDrhaLXp9iIPQ4fWU1ec67iNcYY2lHDm6jbwxKs8MokYaFIv0
 NClJ2jIcWfIYL+h1F4B+d3wT/wdYjDFqyYbu8cyRdDg+E72SkKKVf/3go2VgcyvBuBMcEUIPBVr
 e998tx39aK4OLOp9LD3ayHEzmY6g2s04uDoT46INFLiekTbMWQ==
X-Received: by 2002:a05:6602:6d8e:b0:867:973:f2cb with SMTP id
 ca18e2360f4ac-8675504b269mr45217639f.7.1746637898918; 
 Wed, 07 May 2025 10:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/wX5e69Mhobwt2UxF7KW1vk8xgMiCcyMylgrksgKX/WZmmmbkgTlQU19JIYMNiyJAl2ZLlA==
X-Received: by 2002:a05:6602:6d8e:b0:867:973:f2cb with SMTP id
 ca18e2360f4ac-8675504b269mr45213339f.7.1746637898572; 
 Wed, 07 May 2025 10:11:38 -0700 (PDT)
Received: from [10.0.0.82] (97-116-169-14.mpls.qwest.net. [97.116.169.14])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-864aa2bcf11sm263323839f.8.2025.05.07.10.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 10:11:38 -0700 (PDT)
Message-ID: <6528bdf7-3f8b-41c0-acfe-a293d68176a7@redhat.com>
Date: Wed, 7 May 2025 12:11:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <aBqq1fQd1YcMAJL6@google.com>
 <f9170e82-a795-4d74-89f5-5c7c9d233978@redhat.com>
 <aBq2GrqV9hw5cTyJ@google.com>
 <380f3d52-1e48-4df0-a576-300278d98356@redhat.com>
 <25cb13c8-3123-4ee6-b0bc-b44f3039b6c1@redhat.com>
 <aBtyRFIrDU3IfQhV@google.com>
In-Reply-To: <aBtyRFIrDU3IfQhV@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vr8M0bed1epEKgdI9dXmcy6VJUTfpTr8S7N6jpwahgg_1746637899
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/7/25 9:46 AM,
 Jaegeuk Kim wrote: > I meant: > > # mkfs/mkfs.f2fs
 -c /dev/vdc@vdc.file /dev/vdb > # mount /dev/vdb mnt > > It's supposed to
 be successful, since extent_cache is enabled by default. 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCiJE-0003xk-6A
Subject: Re: [f2fs-dev] [PATCH V3 0/7] f2fs: new mount API conversion
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
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/7/25 9:46 AM, Jaegeuk Kim wrote:

> I meant:
> 
> # mkfs/mkfs.f2fs -c /dev/vdc@vdc.file /dev/vdb
> # mount /dev/vdb mnt
> 
> It's supposed to be successful, since extent_cache is enabled by default.

I'm sorry, clearly I was too sleepy last night. This fixes it for me.

We have to test the mask to see if the option was explisitly set (either
extent_cache or noextent_cache) at mount time.

If it was not specified at all, it will be set by the default f'n and
remain in the sbi, and it will pass this consistency check.

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d89b9ede221e..e178796ce9a7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1412,7 +1414,8 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 	}
 
 	if (f2fs_sb_has_device_alias(sbi) &&
-			!ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
+			(ctx->opt_mask & F2FS_MOUNT_READ_EXTENT_CACHE) &&
+			 !ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
 		f2fs_err(sbi, "device aliasing requires extent cache");
 		return -EINVAL;
 	}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
