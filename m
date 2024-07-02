Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 098DE91ED88
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 05:53:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOUZw-0000gt-SH;
	Tue, 02 Jul 2024 03:53:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kent.overstreet@linux.dev>) id 1sOUZv-0000gk-D1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 03:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hDIhoAG5xCGl8/+4vUmo5RSEcftTwK8usEtZnMpgwps=; b=IxJ3NZRLFOqB6TO9anuJSzW4jx
 bkLlAgGbVlbp24A1Y59VnRQ+OHehtijt2YNLWxHi/OyaM/QJs2eAzbZ/5IyRhUxBQFEoQq+5nURhX
 DhXZ1OFHTY52AbprUsccXRjriMXo1W75Oq6kqF9VfSeaJK1HcyoR3WBD5HFBeBHmKQWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hDIhoAG5xCGl8/+4vUmo5RSEcftTwK8usEtZnMpgwps=; b=O5YK6VMz90xN4s4Uz3vj9CKIxP
 37H4D4EXhdtBvg7eXeTB4RV0Q9kVZQMUsGU96tyEnEQpAJbJ3iLNU3I4AMaGv3mLv8bWGzn0V1yCO
 l0gKqnv0A8vZ0rRbWhEY5rH/IGUghpUCwy54ltX/6LRRzUJv8AQd8uc/DxpMKb7IQ0/g=;
Received: from out-181.mta0.migadu.com ([91.218.175.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOUZv-0002do-I8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 03:53:16 +0000
X-Envelope-To: tj@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1719892388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hDIhoAG5xCGl8/+4vUmo5RSEcftTwK8usEtZnMpgwps=;
 b=OR2tnmeqkD2ae0wGDOz3WC8E4fEbqUMIA1xwC9OMeOW7qLA+znxxXNyuMHkkzefHMQVUf/
 +8FPT3rDYvdnJGqaDOGzv8PfKB+w30xUHu4TgvU8S/zMWs40M6V7g60RAWtB6hcH6tUXKk
 tke2Rpu+SLzVitOIYGPDk2WG6VumNIk=
X-Envelope-To: yi.sun@unisoc.com
X-Envelope-To: sunyibuaa@gmail.com
X-Envelope-To: jiangshanlai@gmail.com
X-Envelope-To: jaegeuk@kernel.org
X-Envelope-To: chao@kernel.org
X-Envelope-To: ebiggers@google.com
X-Envelope-To: linux-f2fs-devel@lists.sourceforge.net
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: niuzhiguo84@gmail.com
X-Envelope-To: hao_hao.wang@unisoc.com
X-Envelope-To: yunlongxing23@gmail.com
Date: Mon, 1 Jul 2024 23:53:01 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Tejun Heo <tj@kernel.org>
Message-ID: <ycmaxfuqpnj3vnmseikx7m7jkzsp2t2qtlncgub44xhxohs6du@hucdavhpcvpi>
References: <20240701075138.1144575-1-yi.sun@unisoc.com>
 <20240701075138.1144575-2-yi.sun@unisoc.com>
 <ZoLoJ-uBo9qyAlMg@slm.duckdns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZoLoJ-uBo9qyAlMg@slm.duckdns.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jul 01, 2024 at 07:32:23AM GMT, Tejun Heo wrote: >
 Hello, > > On Mon, Jul 01, 2024 at 03:51:37PM +0800, Yi Sun wrote: > > +/*
 > > + * If a work may do disk IO, it is recommended to use struct [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [91.218.175.181 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.181 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.181 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sOUZv-0002do-I8
Subject: Re: [f2fs-dev] [PATCH v2 1/2] workqueue: new struct io_work
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
Cc: yunlongxing23@gmail.com, ebiggers@google.com, linux-kernel@vger.kernel.org,
 jiangshanlai@gmail.com, Yi Sun <yi.sun@unisoc.com>,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 01, 2024 at 07:32:23AM GMT, Tejun Heo wrote:
> Hello,
> 
> On Mon, Jul 01, 2024 at 03:51:37PM +0800, Yi Sun wrote:
> > +/*
> > + * If a work may do disk IO, it is recommended to use struct io_work
> > + * instead of struct work_struct.
> > + */
> > +struct io_work {
> > +	struct work_struct work;
> > +
> > +	/* If the work does submit_bio, io priority may be needed. */
> > +	unsigned short ioprio;
> > +	/* Record kworker's original io priority. */
> > +	unsigned short ori_ioprio;
> > +	/* Whether the work has set io priority? */
> > +	long ioprio_flag;
> > +};
> 
> There are fundamental limitations to this approach in terms of
> prioritization. If you tag each work items with priority and then send them
> to the same workqueue, there's nothing preventing a low priority issuer from
> flooding the workqueue and causing a priority inversion. ie. To solve this
> properly, you need per-issuer-class workqueue so that the concurrency limit
> is not shared across different priorities.
> 
> Now, this limited implementation, while incomplete and easy to defeat, may
> still be useful. After all, ioprio itself, I think, is flawed in the same
> way. If f2fs wants to implement this internally, that's okay, I suppose, but
> as a generic mechanism, I don't think this makes a lot of sense.

And I wonder if the reason for submitting from a workqueue isn't also
priority inversion?

I haven't looked at the f2fs code, but that comes up in bcachefs; we
have IOs that we submit from worqueue context because they're submitted
in contexts where we _really_ cannot block - they're metadata IOs, and
thus also high priority IOs. But if the queue is already full with lower
priority IOs...

perhaps what we need is a bio flag to say "do not block in the
submission path, queue is allowed to exceed normal limits for this (high
priority) IO"


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
