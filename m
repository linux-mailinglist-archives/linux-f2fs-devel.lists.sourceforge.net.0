Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B843689D105
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 05:29:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ru2AP-0002YI-NO;
	Tue, 09 Apr 2024 03:29:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ru2AO-0002Xz-5Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 03:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8faRFJtMe7smrQzcZKbC+pfwfy4tfq2RtbQJUPLdRow=; b=ZU1XuPDonJGXBE9H8NhkobjsUH
 +qZ+XGUIt2+1sUeu3sgqqRfJ7caOSmf09q5wguCdxzvw9HZr9NzJ/n2LvYK4n5kHR8azKHWZ26MX/
 f+Hhja+Nt8GrGlKwC4CNKBS1WavMT+AiY28Q+tuBLKgTIphEqPBbeMNBZXipDCOPDnMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8faRFJtMe7smrQzcZKbC+pfwfy4tfq2RtbQJUPLdRow=; b=f8KBW7x3lAK2OK+Za/eaHON9sK
 U7Wa/DFstO7ibS63zQ6YmtUWP2m4IuCUIAAkt7gUZOe3MdbH0DfkyzjLLO2YKOUOirk6wDwrhdAA9
 4VVy+6fftg2dx7j72mGW94iKSnwVxOZvVuAejop7mES1qoOSMXqBfLl0TF/o2VwbS/0Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ru2AO-0007tE-AU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 03:29:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF66D614D1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Apr 2024 03:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4455C433F1;
 Tue,  9 Apr 2024 03:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712633329;
 bh=TbQklYjbUrxaNcuMhf8g6XRM8tCHCxXjlXWV/np6cTc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=lhgS7JPOdNStSELcs7PFfBmUShugsxzq0Errfw34C0kOMOvpZyKF8SmMmrCPjAhsl
 8kgsgCtwQhdYiCz+a0FGy/p7gj3NV+RuY9X0+BwHGo4qnjfhGSsjVB1jEKkLh7/Zmn
 gI0MeepmkctDVlpsCyXGmynJBMSYB/Dn5m8urC9H3+4F2Q/5Ct6BY+hSNLEBNxYKIK
 12nHKGwtGOnbuxu1D5I1sxa3NBt10bfNFTT3/B71/0zEI2V3nlF4aia6hDkAsgmPQU
 mYK782AAnF1SsStXS6bM8rfzcrNNWIl8/nOSCpC1Z3SOlQA4AzZS+NsNwybivI3VP/
 v7UhdpQRTDXew==
Message-ID: <b12a684d-899f-4679-b35b-eb09e8e2a76f@kernel.org>
Date: Tue, 9 Apr 2024 11:28:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20240402235447.132195-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240402235447.132195-1-jaegeuk@kernel.org>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/3 7:54, Jaegeuk Kim wrote: > This addresses high
 GC cost at runtime. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ru2AO-0007tE-AU
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: give 6 sections for
 overprovision buffer
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

On 2024/4/3 7:54, Jaegeuk Kim wrote:
> This addresses high GC cost at runtime.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
