Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C530950A9B1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Apr 2022 22:05:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhd3b-0001mW-H3; Thu, 21 Apr 2022 20:05:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sijielan@gmail.com>) id 1nhd3U-0001mK-0K
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 20:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NwdH8+rjRDlxFy4vl9CTk6e7tYB9OyxwRDgNSZG6Y1w=; b=gWoIEF8qimI7XkS8usU3gv5rKT
 nowFmE3Wzlq4EUQRUZqTrI2DPriG2hMdG58pQNs/7ta4OvksMESbqA20c8H9dG5XX7+Gmwi/phdBY
 iWi1/0MLYw/oygvzQwB7uxOla4ntUNRsmRxlEg2rROz8sywEPop16eeaAO1LsoO/ZS6U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NwdH8+rjRDlxFy4vl9CTk6e7tYB9OyxwRDgNSZG6Y1w=; b=H
 0Eolq2rTgjkk5JGQvvwlZErKwkiR7GavI+mCZlnKIPfJ6Qw4BbLiC318WeDtHcRmSRSDtSWZ79KZm
 eOrHx/odVW9tzzhFcT1ixPel6D824ijumqJLhihSGyiiVPwsScQUSrtKwwJyK56RCY4GJF6mIWDmG
 i2TXDTYnRvzbaDjY=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhd3U-005oTK-1j
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 20:05:32 +0000
Received: by mail-lj1-f172.google.com with SMTP id c15so7065363ljr.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 13:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=NwdH8+rjRDlxFy4vl9CTk6e7tYB9OyxwRDgNSZG6Y1w=;
 b=YrT0DkychC77xvw7gJZXCDCRRTcc+xmzapsBzZPiAAvGHZjAj+/Hrm64XP2N6QsLr0
 XbKrROYW1QSRx+7LLCG+PxohFfhZ6HQV2dN9+wn2CLFyBAudL9tE71yhW2eWUA/K/6cf
 9zAm6A5EYu46D5Oy3mwRB7TR0oeT56u0pxmHcJMpIKS5bsgTznedVjJqTF/nBGVYraSi
 ya9nDYtzOmQ1JpgO4DPW7h4xYv7CqD7apDc7Vq/jTPG7NWqGeFnMT0V5LMW53snRHg+P
 fgpWvcRZuqj4EB+V0pr1z468mJSN/gz51J4KciBvatX1FTaw+cayrBkdaQSRCMIg4Xpf
 13lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=NwdH8+rjRDlxFy4vl9CTk6e7tYB9OyxwRDgNSZG6Y1w=;
 b=vPDvYo+FmOUZCIyShc05f/g68u+CbxLK9ZnlHh/nmQDcrNzfkBHMWTzaSRTdbpVTBf
 b3+QHU3HpFJZ1i7QCCPbkrWeV5K/epJ8ou9E79bXSj6dL0/mPCnnsSprW57aOKb4D6OG
 pEiD41XV7xQWaihREvkaBMbS1toY9xvjxOqr+Axscpq35/NXh53LmYqMcAAj8XAsPQGK
 /L0w0MRkrMzBeo2uGoaJI81P185FGPmYPu0ixpVU5zT+tCsduX3rAvFxlHw8fERE6mMA
 6FnlF5RevJl6axdwC7HbYIQzHHQhm5KPYqaVn0fbH2h7VkGMOekPd3GXVsulKPtd01jC
 jtlg==
X-Gm-Message-State: AOAM5332EZbjIj5HtkV0PO72bZlotdBe3qFk2HF67zW2Az1oYhrpM2ha
 3nMB4Li3QJvPiSTGGURUlieibUZuZxGRI9vtSm58dlVHk8bUcA==
X-Google-Smtp-Source: ABdhPJxShZhUS+HQK07Jssgwyjgayzn2Kw8PyjOvVwaF124XPAVE/3x+jxQezOz2M00QTV9JWYmYp9lw4IN4dUYnU74=
X-Received: by 2002:a2e:888c:0:b0:24d:ba94:260c with SMTP id
 k12-20020a2e888c000000b0024dba94260cmr748648lji.403.1650571525324; Thu, 21
 Apr 2022 13:05:25 -0700 (PDT)
MIME-Version: 1.0
From: Lan Sijie <sijielan@gmail.com>
Date: Thu, 21 Apr 2022 16:05:14 -0400
Message-ID: <CAGAHmYBpipWnVaqBsLLXUYE-BdusGg=qZAHno9OE2hkzitOxUQ@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  HI, team, When we run fio random-write test with 1, 4,
 16 threads
 on compression f2fs, the throughputs on different threads are roughly equal,
 we expected that the throughput would be increased with mor [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sijielan[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.172 listed in list.dnswl.org]
X-Headers-End: 1nhd3U-005oTK-1j
Subject: [f2fs-dev] throughput on F2FS
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
Cc: linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

HI, team,
When we run fio random-write test with 1,4,16 threads on compression
f2fs, the throughputs on different threads are roughly equal, we
expected that the throughput would be increased with more threads, but
it isn't.
So we are wondering if anything we ignored?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
