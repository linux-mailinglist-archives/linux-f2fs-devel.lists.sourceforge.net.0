Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B504793C7A6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 19:28:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sX2GU-0002Xu-EE;
	Thu, 25 Jul 2024 17:28:31 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kreijack@libero.it>) id 1sX2GR-0002Xl-Ku
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 17:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NfPTdF6NiK8Ugj9UJnwjr7KjQLdt6YNvXp7SXJiAaTA=; b=IQrKh2NvTPQzrqEUL0+dNDzjcH
 NzuXol9Nbp+d58/5bx8Xi2OC0jaSreRAsp7cm6o0GDYoCI2Y24rmOppLyZEBfrSmbH/rctinwXFN+
 FYoPbTQMXDdbyqXlPuB5mmnC9ViYCcoFK0X97yEdINCrqNAjY+fQ/MhMN3bDNveDOsww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NfPTdF6NiK8Ugj9UJnwjr7KjQLdt6YNvXp7SXJiAaTA=; b=dSLyM3QzY/JRI8RLw361IUisDW
 kmLXqDA15IFBXmcFBV30/SdTnHudt0igAVZrXKUyAzRWxt2eApdLqRViP23PlJnup89xBOjwvY8sQ
 KulqcvyMGSHMNIEVR3UxD72rMzVI2nl6RRcIKXkgbFh+pZIr2a5xqPpjeEzV6VTn1UOc=;
Received: from smtp-18.italiaonline.it ([213.209.10.18] helo=libero.it)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sX2GR-0007XC-Da for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 17:28:28 +0000
Received: from [192.168.1.27] ([84.220.171.3]) by smtp-18.iol.local with ESMTPA
 id X22gsAgcOUZkEX22hsDYMn; Thu, 25 Jul 2024 19:14:16 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1721927656; bh=NfPTdF6NiK8Ugj9UJnwjr7KjQLdt6YNvXp7SXJiAaTA=;
 h=From;
 b=sv2rZIsuh+TZrJuuwjVZQ+UNjifdwjxYosNmNRvlVCw3eTselSqPsCJJ+mfWUKChB
 IOW33olXIzZzs49jRf2lXOOZh9jSEas/WyD9vlIUHYsMa58AYH02usPcCXsVq30MxA
 w9UnOEfc3/FF8gl3OtLWEnMDA3ETw4T+AHiiamykbU37SUDAIUf4qAmMUaeeRdqomW
 53FHICYBUJER18vN9zpu0yI7fUDZf/FdS9ETOvwQaFrRlXx/FEJfsuqm3Q16TqPvSl
 BWUZOheBPOTcHIQmeHKLax//MkJWiEHZrHbcmk64/nw7G1Mhd6PbCLw1W2HB6KVhan
 OofMRLPiVNNVg==
X-CNFS-Analysis: v=2.4 cv=P43xhTAu c=1 sm=1 tr=0 ts=66a287e8 cx=a_exe
 a=hciw9o01/L1eIHAASTHaSw==:117 a=hciw9o01/L1eIHAASTHaSw==:17
 a=IkcTkHD0fZMA:10 a=2a-IQ_BPnOOq8STWmVUA:9 a=QEXdDO2ut3YA:10
Message-ID: <68584887-3dec-4ce5-8892-86af50651c41@libero.it>
Date: Thu, 25 Jul 2024 19:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>
References: <20240723083239.41533-1-youling.tang@linux.dev>
 <20240723083239.41533-2-youling.tang@linux.dev>
 <Zp-_RDk5n5431yyh@infradead.org>
 <0a63dfd1-ead3-4db3-a38c-2bc1db65f354@linux.dev>
 <ZqEhMCjdFwC3wF4u@infradead.org>
 <895360e3-97bb-4188-a91d-eaca3302bd43@linux.dev>
 <ZqJjsg3s7H5cTWlT@infradead.org>
 <61beb54b-399b-442d-bfdb-bad23cefa586@app.fastmail.com>
 <ZqJwa2-SsIf0aA_l@infradead.org>
Content-Language: en-US
In-Reply-To: <ZqJwa2-SsIf0aA_l@infradead.org>
X-CMAE-Envelope: MS4xfG/Wvh0SRpiC6+9TK5wDnJHkad1zDDvsaBJvq3RV0wxQe/gsCv892ru65MTczmo5pUQbMVX1NrSDKvwqHfPhuJBf0ZxGzZeEL+a+mvbgls/Akdt1xnWI
 QVhkfaLd9wCv/5kE+RXroTc8NBaqfGNvTkgm8wW/kV+ID+bMQPyU9v2N50kCXz/az8FjEsLILcwQkb56M9QCNJLf5/x4Edv+D9ZhMzYbSo8fSwZGhzvPUhFy
 alLW3nbg9ry6fouAwd6fMSP76dUADaS1CRxSpsHzaCoHNwECubxa/2NXm3ZYxMpcjU8sN2MtV21GcpexDxmy+Sr3xbx+P6Vt1DU7fGY56SSYqSvs5k73a0Du
 GxpE2dsJ5cD+U0N9zYReAO4pGZvz3VWIDnOB06t6HoHLF24cazVbsYQuF6IIM2VQm7Mbu1G8Jd56XLbPJb4RCy1Z1fkWC6H3z8C7pr/rpSYiK3hhZBwrFydP
 fUV66fKGVnIFcE1O24B5weWxHgrN1goxpDFVQDc77xc6wCo7bDDaJuZCdAvJHBUQWMiYTlZRbSMOBMvY1xkCktZX2iS13vdrThLlld56N+oUhO0t70FYx+uj
 YxVqoXAL4Ts8d2ykDkeTVr3CUL4HiWTiWGozXnb8THEphRoSBFPeFuOUBiETwenwSU0MOY11dbBFOqGBybicQS69laD9aAqO314s+9tUAJrvzHltLzTYuD/q
 PdS1vxWgkiPYI+0XgUX2wtTCNSW5xE4Skow3bECu2B4KzzaztlFzYA==
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 25/07/2024 17.34, Christoph Hellwig wrote: > On Thu, Jul
 25, 2024 at 05:30:58PM +0200, Arnd Bergmann wrote: >> Now I think we could
 just make the module_init() macro >> do the same thing as a built [...] 
 Content analysis details:   (0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: libero.it]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [213.209.10.18 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [kreijack[at]libero.it]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [213.209.10.18 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [213.209.10.18 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.0 FREEMAIL_REPLYTO       Reply-To/From or Reply-To/body contain
 different freemails
X-Headers-End: 1sX2GR-0007XC-Da
Subject: Re: [f2fs-dev] [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
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
From: Goffredo Baroncelli via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: kreijack@inwind.it
Cc: Goffredo Baroncelli <kreijack@libero.it>,
 Linux-Arch <linux-arch@vger.kernel.org>, Youling Tang <tangyouling@kylinos.cn>,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org,
 Chris Mason <clm@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 Youling Tang <youling.tang@linux.dev>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 25/07/2024 17.34, Christoph Hellwig wrote:
> On Thu, Jul 25, 2024 at 05:30:58PM +0200, Arnd Bergmann wrote:
>> Now I think we could just make the module_init() macro
>> do the same thing as a built-in initcall() and put
>> an entry in a special section, to let you have multiple
>> entry points in a loadable module.
>>
>> There are still at least two problems though:
>>
>> - while link order is defined between files in a module,
>>    I don't think there is any guarantee for the order between
>>    two initcalls of the same level within a single file.
> 
> I think the sanest answer is to only allow one per file.  If you
> are in the same file anyway calling one function from the other
> is not a big burden.  It really is when they are spread over files
> when it is annoying, and the three examples show that pretty
> clearly.
> 
>> - For built-in code we don't have to worry about matching
>>    the order of the exit calls since they don't exist there.
>>    As I understand, the interesting part of this patch
>>    series is about making sure the order matches between
>>    init and exit, so there still needs to be a way to
>>    express a pair of such calls.
> 
> That's why you want a single macro to define the init and exit
> callbacks, so that the order can be matched up and so that
> error unwinding can use the relative position easily.
> 

Instead of relying to the "expected" order of the compiler/linker,
why doesn't manage the chain explicitly ? Something like:

struct __subexitcall_node {
	void (*exitfn)(void);
	struct subexitcall_node  *next;

static inline void __subexitcall_rollback(struct __subexitcall_node *p)
{
	while (p) {
		p->exitfn();
		p = p->next;
	}
}

#define __subinitcall_noexit(initfn, rollback)					\
do {										\
	int _ret;								\
	_ret = initfn();							\
	if (_ret < 0) {								\
		__subexitcall_rollback(rollback);				\
		return _ret;							\
	}									\
} while (0)

#define __subinitcall(initfn, exitfn, rollback)						\
do {											\
	static subexitcall_node node = {exitfn, rollback->head};	                \
	__subinitcall_noexit(initfn, rollback);						\
	rollback = &node;
} while (0)


#define MODULE_SUBINIT_INIT(rollback) \
	struct __subexitcall_node	*rollback = NULL

#define MODULE_SUBINIT_CALL(initfn, exitfn, rollback) \
	__subinitcall(initfn, exitfn, rollback)

#define MODULE_SUBINIT_CALL_NOEXIT(initfn, rollback) \
	__subinitcall_noexit(initfn, rollback)

#define MODULE_SUBEXIT(rollback) 		\
do {						\
	__subexitcall_rollback(rollback);	\
	rollback = NULL;			\
} while(0)

usage:

	MODULE_SUBINIT_INIT(rollback);

	
	MODULE_SUBINIT_CALL(init_a, exit_a, rollback);
	MODULE_SUBINIT_CALL(init_b, exit_b, rollback);
	MODULE_SUBINIT_CALL_NOEXIT(init_c, rollback);


	MODULE_SUBEXIT(rollback);

this would cost +1 pointer for each function. But this would save from situation like

	r = init_a();
	if (r)
		init_b();
	init_c();




-- 
gpg @keyserver.linux.it: Goffredo Baroncelli <kreijackATinwind.it>
Key fingerprint BBF5 1610 0B64 DAC6 5F7D  17B2 0EDA 9B37 8B82 E0B5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
