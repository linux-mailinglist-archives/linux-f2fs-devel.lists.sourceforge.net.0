Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9E4623D6E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 09:22:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ot2ps-0007nE-Iq;
	Thu, 10 Nov 2022 08:22:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bagasdotme@gmail.com>) id 1ot2pr-0007n8-Eq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 08:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BG2nzthEmyoGwZ2xnXYghTQwVyPBN3+wYVO3ZQp4p8o=; b=JwizZoUt4kPw1QBgm4j1snT/w+
 Upqj4WZPbZCPRpkaWk8LZZe3sqfLZsuazlFc2p+JjC/2Se+2E+TJUzrSq4yJOK/s13R0uecWxvZnW
 EW4g/nVkdUeFPBg4FkdR1t52nzC//u/Wrl6DHQRmp4ubmKo47p7MEd6kgJkGrSdozl4A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BG2nzthEmyoGwZ2xnXYghTQwVyPBN3+wYVO3ZQp4p8o=; b=EaYr7QJ0FtjzgREVOglNlx9kD2
 AVYcz3BTvEb2M71Uva5WfMxwVKUaAhXgKOrgiWjwXm6FcuEgTm5sZ+Fe2G/uggm4XRaCBu/wjN3rB
 IhwgXINCPJeBOfFazSwBIbeZQlUI2vGsD29BfNivE6klQ0n88UBufyCPO4QORWx1cEg0=;
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ot2pq-0006MQ-9U for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 08:22:55 +0000
Received: by mail-pg1-f175.google.com with SMTP id s196so1109785pgs.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Nov 2022 00:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BG2nzthEmyoGwZ2xnXYghTQwVyPBN3+wYVO3ZQp4p8o=;
 b=qEGP/jzAGERpSJ2HAdKdjTD3CLELEnHqw0Od9noXgvj2iH2RfDvff1LdH+PFNUUP9y
 3XFAj9ZZSpw6XG7RpoHLC4lxpOwx5KbjG3yE8u+TY/rAiGJYIVyw1yvMZTTXk39AdlZs
 JCNY6jTmCiKJOzMRaOGvT0Kq6Q7TE24v7GyytyyIMia63isqtreovofwjwPTSx5Y35iA
 nRDv1glNFZ2eKOLFyGJgZ4UTewJ4VfPd7qmw3/zQ1NVqS/6/yB3DsQMFDFOwJm8WzPwO
 enC8/nsjCwW84dc/ObApWjlsdN1XAaN7IWePQCoAWwxYAY6YyUwlItSfYH3s6FTz1zLu
 mXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BG2nzthEmyoGwZ2xnXYghTQwVyPBN3+wYVO3ZQp4p8o=;
 b=Hx5bJGcFrspFYUfsGwpiNnWevEmunHic1ijO3nSuY5iSLvxx55OJIWEaTyTBH2ig9P
 zAQjmsfHnlI5uRcBXacC6/HG0Waob9Sg+h9LUwkNW8nLRIicXQ3c8S8HZem5KCRsvMGm
 ngvOCT3X9IYdDg/eGNTQHurJqmBzJbChKyXK8JpSatt1FqTdjvyX/ss7MYSBD+6t3ptn
 o1zOrC+dYKYR76RSZqh7yrVlp6Fd7MjS0moho1nRPq+ntdjBSy0PEX7sfeM+8Rz5gNm5
 pQMqD06bylwqEHnrlFC3ROjWEjmoLK+HftBMPIvRzNBvqPDaX0w+l2vxFnmtqffAFVxr
 fGNw==
X-Gm-Message-State: ACrzQf1HauUTj0Olpz3xNBXGVBcImU2eZQe3TUcxKLOQr3Xg+Mh9dWEZ
 oBF1uKz4fdAHtjLWKXMfkDe4ESN8FFzHPA==
X-Google-Smtp-Source: AMsMyM7PmkX37DHPRpa1E+mx91ZBJY53DfFvZFhJAYLfvahogpFu57m0IgO8z/L56jKPYQ53iJQ8Pw==
X-Received: by 2002:aa7:8c0e:0:b0:56b:dbab:5362 with SMTP id
 c14-20020aa78c0e000000b0056bdbab5362mr2087321pfd.47.1668068568645; 
 Thu, 10 Nov 2022 00:22:48 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-81.three.co.id.
 [180.214.232.81]) by smtp.gmail.com with ESMTPSA id
 nm13-20020a17090b19cd00b0020087d7e778sm2516887pjb.37.2022.11.10.00.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 00:22:48 -0800 (PST)
Message-ID: <dd4deb4d-ec9e-8cbe-2835-d8b9931e7f30@gmail.com>
Date: Thu, 10 Nov 2022 15:22:43 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org, chao@kernel.org,
 corbet@lwn.net
References: <20221110032522.64043-1-frank.li@vivo.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221110032522.64043-1-frank.li@vivo.com>
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/10/22 10:25, Yangtao Li wrote: > Since we now support
 read, write, and discard in FAULT_INJECT, > let's add support for flush.
 > > This patch supports to inject fault into __submit_flush_wait() [...] 
 Content analysis details:   (1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [180.214.232.81 listed in dnsbl.sorbs.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bagasdotme[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.175 listed in wl.mailspike.net]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ot2pq-0006MQ-9U
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support fault injection for flush
 submission error
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/10/22 10:25, Yangtao Li wrote:
> Since we now support read, write, and discard in FAULT_INJECT,
> let's add support for flush.
> 
> This patch supports to inject fault into __submit_flush_wait() to
> simulate flush cmd io error.
> 

What about this description instead?

```
Since FAULT_INJECT have now support read, write, and discard operations,
add also flush support. An usecase is to inject fault into
__submit_flush_wait() to simulate flush cmd io error.
```

-- 
An old man doll... just what I always wanted! - Clara



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
