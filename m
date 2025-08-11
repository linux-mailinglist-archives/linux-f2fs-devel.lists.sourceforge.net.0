Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44748B20B01
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 15:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSm8RCQPOwIzKfQVSTfHepitz+QoVpdWMYmdBVxmMQs=; b=Jmyrlymc4e4al05dpVAq/Y0NgV
	YhQOEBPZ3fenH4CiybcLcnQLVECmfWe2OcvBSBEwAtJr1+FXyzPuV0BCFOpsdxUpND3i9RzNz/7J0
	MHGSqCz5ilk9T+1FgzJnak25n2Q3IqH36wLcQXX+B2cIl0CeO5nHC81R2ctAZzfm+Za8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulT3x-0005Gy-4J;
	Mon, 11 Aug 2025 13:59:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bvanassche@acm.org>) id 1ulT3W-0005GV-Al
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 13:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6RgpocCbKdVK3rc0ouSRaRbCuDPNs0B+gHPMVM2wrSs=; b=kbozhItz9wW8e+gHKvzNJiNAUa
 Why9mACI9VE3pR9m+VA2huTiL+wYefJoEkiSjWNUSnxdA1EjrJ9/VBry1HYjYNynUWqXY+No+48CN
 AjSomo+H726rE1hZa6JyiKfUdOJNZKEbYkhF7zI18O6QcIvktDfsRSkL1EKXYJeTHd1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6RgpocCbKdVK3rc0ouSRaRbCuDPNs0B+gHPMVM2wrSs=; b=Yp5/9rg/rh1lhpEB8J0h7VSBmi
 DwustP+kVohvvFpEeySo+9LM9zOMLUAVX31ad7gk+kzSMPkDCyHU1NqeKeTdLj4LX+41yW4b4mIz7
 gFB3NtWumPhQgv4wLl9vpOJlbB0LZBNyx6KExLIi0d/awUbCeEWiRSSnkmxXxviVXioo=;
Received: from 003.mia.mailroute.net ([199.89.3.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulT3V-0000Ih-M8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 13:59:18 +0000
Received: from localhost (localhost [127.0.0.1])
 by 003.mia.mailroute.net (Postfix) with ESMTP id 4c0wph1WmjzlgqVH;
 Mon, 11 Aug 2025 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:content-language:references:subject:subject
 :user-agent:mime-version:date:date:message-id:received:received;
 s=mr01; t=1754919850; x=1757511851; bh=6RgpocCbKdVK3rc0ouSRaRbC
 uDPNs0B+gHPMVM2wrSs=; b=vnBct1XtLEmuWRMwhpQxh3008HbQS4f/9t+Kpm6N
 MZLmGuJnFN3K6+NLl59WG1eFBv5js+ZWTuiRWovAIhjbBAVuYtBrrsR9rUGV5IY8
 z90sHuF7C5Nq6Gid/5FwhLT169NHs8viX/Z3rAOXsKaQ5LcOisegWMykZX8Agjbc
 8ZDGxQVTToUJKHOn/dlXmpoqAIbFJQuBft5gvf8VysExz8ezU+IBRGURYghKvEO5
 HW0P7ctLhWLa1PLxm/ddoA0RQdQMwrgMiVkD4KjnJ9l4Lt1M+098YxfMGMBd4Zji
 urN+4YfslxDNO8d9iwgBCLozeTavC0WkgJtLBLREwRpARA==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 9mPmr6_UW5sq; Mon, 11 Aug 2025 13:44:10 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net
 [73.231.117.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4c0wpZ1BwpzlrnQ6;
 Mon, 11 Aug 2025 13:44:04 +0000 (UTC)
Message-ID: <7a2534f5-bf20-4d3c-afe7-afcb8f340929@acm.org>
Date: Mon, 11 Aug 2025 06:44:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@infradead.org>, Chao Yu <chao@kernel.org>
References: <20250807034838.3829794-1-chao@kernel.org>
 <aJnLXmepVBD4V2QH@infradead.org>
Content-Language: en-US
In-Reply-To: <aJnLXmepVBD4V2QH@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/11/25 3:52 AM, Christoph Hellwig wrote: > On Thu, Aug
 07, 2025 at 11:48:38AM +0800, Chao Yu wrote: >> This patch introduces a new
 sysfs entry /sys/fs/f2fs/<disk>/flush_policy >> in order to tune [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [199.89.3.6 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1ulT3V-0000Ih-M8
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: introduce flush_policy sysfs entry
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
From: Bart Van Assche via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Bart Van Assche <bvanassche@acm.org>
Cc: linux-block@vger.kernel.org, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/11/25 3:52 AM, Christoph Hellwig wrote:
> On Thu, Aug 07, 2025 at 11:48:38AM +0800, Chao Yu wrote:
>> This patch introduces a new sysfs entry /sys/fs/f2fs/<disk>/flush_policy
>> in order to tune performance of f2fs data flush flow.
>>
>> For example, checkpoint will use REQ_FUA to persist CP metadata, however,
>> some kind device has bad performance on REQ_FUA command, result in that
>> checkpoint being blocked for long time, w/ this sysfs entry, we can give
>> an option to use REQ_PREFLUSH command instead of REQ_FUA during checkpoint,
>> it can help to mitigate long latency of checkpoint.
> 
> That's and odd place to deal with this.  If that's a real issue it
> should be a block layer tweak to disable FUA, potentially with a quirk
> entry in the driver to disable it rather than having to touch a file
> system sysfs attribute.

Chao, two years ago Christoph already suggested to integrate this
functionality in the UFS driver. From
https://lore.kernel.org/linux-scsi/Y+NCDzvuLJYGwyhC@infradead.org/:
"Please add quirks for the actually affected devices, and do not
block fua for an entire transport."

See also the ufs_fixups[] array in drivers/ufs/core/ufshcd.c.

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
