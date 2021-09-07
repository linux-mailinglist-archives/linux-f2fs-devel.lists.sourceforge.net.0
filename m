Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C224B402989
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Sep 2021 15:19:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mNb0M-0002u3-5Y; Tue, 07 Sep 2021 13:19:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sb56637@gmail.com>) id 1mNb0L-0002tt-Do
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Sep 2021 13:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:From
 :To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s3WWSJusRKRUfc5xJ/Hb1Tl18z4wmN4N6IT7pF4VRS4=; b=a+8Fzc2ZozkdfUcesNvm3W7XNm
 ILBtpmGIbRkqYYQFfHEigrZZbcsvQVzGhWDCpDJZMP3B6xB6JBdtLCBoiAMn/ZP0NqyXuVkL51OeN
 aefypPB9j8dhGqVnUEUOA4mZf7hcK3ACti/A9esWrl0kGs0jm6J4CrcoTUsJyQC3W2u4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=s3WWSJusRKRUfc5xJ/Hb1Tl18z4wmN4N6IT7pF4VRS4=; b=k
 g+G7l8Hf3vzJJtf74wxbEIIGj7Qi+ElZdr+GPDqJzI6o7dVsosAuVuvWoibpBP2TEb1vZ/id/mlRP
 20k8lHWsGShbGPGnBO6k8mg+F28pCMTEpG2GS80g0IU7O2bSJGIgdEONHeAr+XXYZZALXVnYlRhDR
 6xrbo7mLjoRzlcJE=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mNb0G-0019J3-86
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Sep 2021 13:19:13 +0000
Received: by mail-pg1-f172.google.com with SMTP id c17so9972119pgc.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Sep 2021 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:content-language:from
 :subject:content-transfer-encoding;
 bh=s3WWSJusRKRUfc5xJ/Hb1Tl18z4wmN4N6IT7pF4VRS4=;
 b=DhixThxdW1KubSNNAVmaJwTUOfWA6Ol2KC0p7yb9u6jcX4nL3TXk2JxPYV71UmoeHr
 eXeqCYhIOd2JJKEivfNNI25/mFYdMHyreu0ZExqOEEYAU0x7YK3+SUsLLkl+kCozjQ8D
 b1s7ThyXhBBRpNljBD309M9Ct/qOwOfqZcDCJXnpzIIaQZMHau1+TA/v5mgNfmPfm71o
 6fJqIJXA9GzoZn9w5RDHM2nalchw4fia5JmZ8Bj4HPZoGS6pEPgRbhh7ogwm6AKr3BtF
 mE/02u3naNYSw2aRvrozlYPBVnD/Kq11Xrkh18kQoFUlnweCD6uo+OsFmodD5VaZyg59
 d2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to
 :content-language:from:subject:content-transfer-encoding;
 bh=s3WWSJusRKRUfc5xJ/Hb1Tl18z4wmN4N6IT7pF4VRS4=;
 b=txRMMpmQPa+XjV158fbmJYMiyzQwtvGNyTDFVffGF1k4cHlHEN5GIyBeDST1uPIxSf
 onYHvqTNpt5FfEd+ID3JcfOAQCqiIUAJaJnD4m5bHFxJaSH7iwF6X7kdts2NU1081cpG
 wY8vIknwC92cOht8jLhywNZHFB+BRHfAZgUyzdZ/p4MnQNWATK0wIERD4AnH6TU15QFk
 6wjt6Kg8ETa6UJGrvO9XrU8OQ+q8Bkq/9va5VpdM/+FL9XrA6k3ehP/AzcCPiBJnSs7f
 yoA7UyjbQg7La1zcTJGq3vsTY/hS5XbzcxCi4K/eaCmhir1Ckfego3jA98tHR6JZ8Okx
 xDNg==
X-Gm-Message-State: AOAM533h3pT2ElbWnaNBplm6Ig7nGMBknC5689exIGAz7D+btr8HlYM9
 eAqfQetXKhnnaHngn9id0Qs4MDL2Q1E=
X-Google-Smtp-Source: ABdhPJw8wrcQJJojA0RcPr1Bqev1ygF8av09iA8IG15FlhnBa2etj3z4gfaoeh5TcXEZkK+uXjfe6w==
X-Received: by 2002:a63:155d:: with SMTP id 29mr16935993pgv.118.1631020742302; 
 Tue, 07 Sep 2021 06:19:02 -0700 (PDT)
Received: from ?IPV6:2800:370:145:7300:26a2:8cab:1be1:82c0?
 ([2800:370:145:7300:26a2:8cab:1be1:82c0])
 by smtp.gmail.com with UTF8SMTPSA id y126sm8008263pfy.88.2021.09.07.06.18.59
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 06:19:01 -0700 (PDT)
Message-ID: <75f47f9c-4587-9105-81bd-38708df8fab9@gmail.com>
Date: Tue, 7 Sep 2021 08:18:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Firefox/88.0
To: linux-f2fs-devel@lists.sourceforge.net
Content-Language: en-US
From: "S." <sb56637@gmail.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi there, I develop Linux spins based on openSUSE Tumbleweed.
 Currently the base system has Linux 5.14.0 and f2fs-tools 1.14.0. There is
 a bug that I can consistently reproduce with: # mkfs.f2fs -f /d [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sb56637[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [sb56637[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.172 listed in list.dnswl.org]
X-Headers-End: 1mNb0G-0019J3-86
Subject: [f2fs-dev] mkfs.f2fs -f to reformat Btrfs partition doesn't change
 FS type
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi there, I develop Linux spins based on openSUSE Tumbleweed. Currently the base system has Linux 5.14.0 and f2fs-tools 1.14.0. There is a bug that I can consistently reproduce with:
# mkfs.f2fs -f /dev/sda1
When the prior filesystem of /dev/sda1 is Btrfs, the `mkfs.f2fs` command is successful, but the filesystem type remains "Btrfs". Then the filesystem can be manually mounted with `mount -t f2fs ####` but only manually, the wrong FS type confuses the Linux boot process and won't allow it to mount in the case of a root partition. This appears to only happen when the previous filesystem is Btrfs. I have tested this bug to *not* occur when the previous filesystem is EXT4 and XFS.
Thanks a lot!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
