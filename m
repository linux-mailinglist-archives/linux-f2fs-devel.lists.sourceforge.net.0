Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB326955F6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 02:29:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRk8L-0007l8-Ih;
	Tue, 14 Feb 2023 01:29:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pRk8K-0007l1-OE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b3E6Ogin9RnCrucO7eHQcFv8GO233gvSbJLODs50RJ8=; b=I0z27x3MGL31d/0I0RADt70qyA
 E+SRIEWAKO+6syFUQlXVJn1YQfz6F+KbO2BtAsak1lkzVj2w19sonjsdLFqU9CLVQ+qFMOTTR5RjX
 6OjrD45M+lWhaZMhIdX77wpdHDV+XnE8p4E2UynsjeH8iIvcSJbTJa8THdheuwzsOY/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b3E6Ogin9RnCrucO7eHQcFv8GO233gvSbJLODs50RJ8=; b=Dx3M6lkttZ7jVKy7ZbIzehpqle
 v/6Sg7L1K1cUskVxMRolsTL55BBugmJJJGR6XPgKqosaqx10mNMqZSdirpovCxaby+gAbxf2eyO66
 BVonMvm5QFo81i4tguGqQicWdlukCFYhzYkZtah0PuLBuGSI7gG4wey57JtVlVLllBL8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRk8I-003myf-PG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:29:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75166B81A31;
 Tue, 14 Feb 2023 01:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F025BC433D2;
 Tue, 14 Feb 2023 01:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676338155;
 bh=4J95gcSM78Uk8dxMmBWbi4MqR7QMskw4R1zDgItsne4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jXu18eo8ZqciyaJj1xX7hikHszPjmHuZMXhzyTw7DD/fMEbI30tXMssU5EpsgSuzH
 CB5E9jU5TAdeMNCfBkFWJCnKQU2cOmrMlS8NwXhWsQ/xeQY42jttXOFlP6PUtykVbV
 a+zIAu3m1AJloxVzSeV5UqqNntA+0FOyXtOy4F1i+/OqNtMA/QrOrMraJi6iyvay4i
 mh1ZvYg/0Ot3+r4Q1xG6dNuW1WAHUR+bYTJfxJyVmtu+o5vTe+32trmxkNHcR8Z2wX
 kNctWwbA6CYWo03/ro3aSDDqNZtqbbsaxqlP4mjNkcgYg3YC7Zdaxs8NnmSIlKCujx
 Qz2maw1ss7YHQ==
Message-ID: <5fca2ac9-91d6-6a56-5817-ab54d7bcba90@kernel.org>
Date: Tue, 14 Feb 2023 09:29:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230213141825.22858-1-frank.li@vivo.com>
 <20230213141825.22858-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230213141825.22858-2-frank.li@vivo.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/13 22:18, Yangtao Li wrote: > For each loop add
 a local f2fs_sb_info pointer insted of looking it up. > > Signed-off-by:
 Yangtao
 Li <frank.li@vivo.com> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRk8I-003myf-PG
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: replace si->sbi w/ sbi in
 stat_show()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/13 22:18, Yangtao Li wrote:
> For each loop add a local f2fs_sb_info pointer insted of looking it up.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
