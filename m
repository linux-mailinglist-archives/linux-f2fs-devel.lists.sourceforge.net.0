Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EE38B092B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 14:22:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzbdU-0003En-GF;
	Wed, 24 Apr 2024 12:22:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvic9@mailbox.org>) id 1rzbdP-0003DK-I9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GxCfelkVB4uQbpdRMozPh2wL6ZyVHHDqgS5NiqTPQRE=; b=Waikoj5h2XC1zj9NN10Pl4GQlc
 3rohGsXUdmIYlETmmicJlY3tEqizy6DGZ46NclT4w4WYSuf1A1rw/Mt8j1kZXX1BiWPmoGhNYgO0Q
 D1wEvUiVBvoGJvJ72BXA9IsakWZuRq3khCtuOsYvg++euP6R+aTtKsnnK/ksuCFOa474=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GxCfelkVB4uQbpdRMozPh2wL6ZyVHHDqgS5NiqTPQRE=; b=Y6V4ljCSXFQ5Kt/g8/d+AmNWBU
 9IHAZVbzgYn4YfEvaQbjzzEP8ywZgBAtTC1gDtoLyGiPEmPJX6U5TYcFwv0JNMf/6HE3zc+Wx3mr8
 C19hPojmyHiG5YY80yUpi3g1rgy8TP0HVQ9wI8AuuGae58GvSYYUZDDMtiBBnqBcVWLM=;
Received: from mout-p-202.mailbox.org ([80.241.56.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzbdO-0001FI-Hc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:21:59 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4VPdQK48cqz9spZ;
 Wed, 24 Apr 2024 14:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1713961305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GxCfelkVB4uQbpdRMozPh2wL6ZyVHHDqgS5NiqTPQRE=;
 b=gY7isZD5uD5pr+V1ZH4bojC6JtBSF3PvnDOC/G+YW1DcfX5fqXxXmBUpFxM8hWUXfOVBrB
 ZoHyzNvxmA/PgTGcJvDASvU9tUGZegPWJsYAQVfuxkf9BiKdEIQZM26S98Tw/dxYYtunQP
 IDwOMuAahlt1E69G9EPdvokpcWs+NEQ8habdmiEpyPgsTF0kB7jgaP1ZYybeWi7EK+oRci
 +lsRaKYKJLP5VMpxfLsn5BvcZrk4drkqhd2MmkXK1AwuBHqLq50ZuDxpitCmS8h7LOOufd
 +85YEGAc8+xXqRQ+33R9jydJ8phyGMa/LfoceF3+Q7tPUe6QCPdmZcVFnKOhmQ==
Message-ID: <ac903336-0d00-4cfa-b09c-6f99b709af53@mailbox.org>
Date: Wed, 24 Apr 2024 14:21:39 +0200
MIME-Version: 1.0
To: linux-f2fs-devel@lists.sourceforge.net
References: <bug-218769-202145@https.bugzilla.kernel.org/>
Content-Language: en-US
In-Reply-To: <bug-218769-202145@https.bugzilla.kernel.org/>
X-MBO-RS-META: 4i4o51trjz8sigds9fic3d79tbmmtep7
X-MBO-RS-ID: 32f5c6b83ad6cdb8609
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/24/24 13:38,
 bugzilla-daemon@kernel.org wrote: >
 https://bugzilla.kernel.org/show_bug.cgi?id=218769
 > > Bug ID: 218769 > Summary: fsck seems unable to solve corruption > Product:
 File System > Ve [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mailbox.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rzbdO-0001FI-Hc
Subject: Re: [f2fs-dev] [Bug 218769] New: fsck seems unable to solve
 corruption
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
From: Tor Vic via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Tor Vic <torvic9@mailbox.org>
Cc: guido.iodice@gmail.com, aros@gmx.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 4/24/24 13:38, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=218769
> 
>              Bug ID: 218769
>             Summary: fsck seems unable to solve corruption
>             Product: File System
>             Version: 2.5
>            Hardware: All
>                  OS: Linux
>              Status: NEW
>            Severity: high
>            Priority: P3
>           Component: f2fs
>            Assignee: filesystem_f2fs@kernel-bugs.kernel.org
>            Reporter: guido.iodice@gmail.com
>          Regression: No
> 
> Created attachment 306204
>    --> https://bugzilla.kernel.org/attachment.cgi?id=306204&action=edit
> fsck
> 
> After installing kernel 6.9rc5 it seems that all my f2fs partitions are
> corrupted, according to fsck. On boot the check-repair is always performed. I
> also tried running f2fs from a live usb (with kernel 6.6) but the problem is
> not solved. Even running fsck several times always finds problems.

I can confirm the constant fsck issue, and it was fixed in my case by 
the following patch:

https://lore.kernel.org/linux-f2fs-devel/20240409203411.1885121-3-jaegeuk@kernel.org/

> 
> I attach the output of fsck -f -d 1 on one of the partitions.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
