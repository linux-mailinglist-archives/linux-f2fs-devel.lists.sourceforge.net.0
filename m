Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E202CDF4A5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 06:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftz6JBCbN4eD13Szs6CjrBAY9RVu77pF/u8XPWfEcj4=; b=LxqjSVifCYJRl6pfG6pI1cIJwd
	D2GWULGCknPRNtDq18XWZHcXAKD4U3AcaWrZVbCbIPAkh6HYpGhcii0/XfpM4BvP0zRV6GXlHBmx+
	xGCm4+GQF5fctXKQi/ZgorF0cDlK8w/rIwpvkyTsOAUyTkjEPl5t+m1hKJtsc2vDGJUI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZMtz-0000dq-Gt;
	Sat, 27 Dec 2025 05:31:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1vZMty-0000dh-4v for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 05:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fxr0kuOXamHaTFOJJi3xg1BV9U2YiWn4Gu+84ZOzqMM=; b=RW4OIYCYQ0kBgvmc0lx/mmOZQ7
 kDAhgFmyysHl6sW/xrY/wgDpHwFkncM0gV8R+yaR3+NzVOne7RdeLAUMS8XohfE+UihP6IUlwfB44
 T0iUpi1NTHia0hDdg6Xk9GfsUxJvj7ZST3YxeQQsswSGfyFuhuuQJHWmmU3zQEeEHBf8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fxr0kuOXamHaTFOJJi3xg1BV9U2YiWn4Gu+84ZOzqMM=; b=VF6AKFX5w0k2aSTrRKQBt5mlXX
 1Nzp6SuPYhdePkfJfAkNYmDfikw15OutpZ+6sYqzGodjYdXoVAzhFI5u2ttxWb1DVXacVC7299J5R
 8tDKtDNu2CSpXKBV2IKR7dKYKOjJ3Sd6/YoYcwmK013ffPPbNUm4YfrQfpjCIWzYa3V4=;
Received: from mail-japanwestazolkn19012051.outbound.protection.outlook.com
 ([52.103.66.51] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vZMtx-0001Ey-JH for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 05:31:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=do/JEc9zqWTwPKpj8T0XQyxWQqH/IZEIqlG3/N8/k2Ym59170J6IyH/WXQJwsHFWeWeG0pvqazIwl2KHZsTCa6WsIxKJ9FKkeICkDWEIqLRnA90FNT/w792j5i41QMEnVB/iupRMVh09RWVUYXIUTz+y2fdu15FbCP24JIs6tcpjAujTwOI0xNVpY3sBC0tcbXSnJ9ZbevFRPFW+DfpPXvEz6F8nzpUkHGHsoMEjg0upS6HFJnfjwf4b2NTPGVPP4kBcv8aQDN4SkSVZye3WFiK4K1RzYwj09HvPlkA6nHqCdyIp9aVWnuJ3NzZf8lhimJotSUQyHHQlJgyZ8hDAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxr0kuOXamHaTFOJJi3xg1BV9U2YiWn4Gu+84ZOzqMM=;
 b=bHXjqj/6brdU8TpFjfe8oA/16GKtKG16dL2VmDhH0ZiRVKmLMfTjh6R1pX5xaGN4tDKK5ZU4gtBcuknlHyjsEr0FFRpBRr1DWTkF4JSvix4xnKhDuDx/4xGZ+Xxf9/0InlKT3HuftIbIvLRgU2Ee00jrOOGNfunCiNW9yQnaWFB08LlMRDYKOPHJcsGQfzL5WXRwIjx8NkgTTImYbe8jP0xwu737GTU9bU0hWkdXWq0a/BGzITL2xD8Sv7ol7joRCADUX35yKv06mL2fkmf+BH8fzDmDQqYeiXaYGqGZE/WwTfbjbDZwLDHgVUrpOhG7mg48OQlvfaaoOeczW2yXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxr0kuOXamHaTFOJJi3xg1BV9U2YiWn4Gu+84ZOzqMM=;
 b=u6INrEnFHEzzp/rCbZL1wp/GiABy9v7GE5ImpWL54IN6VoO9Il0Royt9fWrtwMfwT3QpGxnprrszBqJ6vfzgWuydgSsbhR2wY7Qf71/JAxLde/6kYhqeO+w1AL38JtLtHzkTHaqNSCpr6y+E6f3p928ex+1i1AXjYYP0Ys+vjlsBMXKa/9Z000tvKeY+i+lrT+B3i4BJkoYOlpTsmFG5grYr/fwZKlvK3Iv8XaovXWi2wtJN3JGUD6Hmj4khlN5Ir7TGVZidfJB3JsmbGQdL44iSMiBy4bPYQNQm1lVYqubMjBL6xXPJ2tmEQqkPwXtHFGEW7bNMct0s1q9jxZtpQw==
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com (2603:1096:101:47::14)
 by JH0PR02MB7679.apcprd02.prod.outlook.com (2603:1096:990:69::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 05:31:32 +0000
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120]) by SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120%4]) with mapi id 15.20.9434.001; Sat, 27 Dec 2025
 05:31:32 +0000
Message-ID: <SEZPR02MB55204BB7016DA5FC8FE6459399B1A@SEZPR02MB5520.apcprd02.prod.outlook.com>
Date: Sat, 27 Dec 2025 13:30:42 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251225125954.4055570-2-yangyongpeng.storage@gmail.com>
 <622035a5-b579-4575-b76c-f7a7b764f0e0@kernel.org>
 <fe7c94da-d16f-4de7-9d03-377e0085d060@gmail.com>
 <a2a86384-c718-4a5e-afef-d3360f327d35@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <a2a86384-c718-4a5e-afef-d3360f327d35@kernel.org>
X-ClientProxiedBy: SE2P216CA0193.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::17) To SEZPR02MB5520.apcprd02.prod.outlook.com
 (2603:1096:101:47::14)
X-Microsoft-Original-Message-ID: <ee3f1a92-76ad-40bf-b148-9bc4d52bc11b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5520:EE_|JH0PR02MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 493f9bc0-2421-40ab-73f3-08de450931b5
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|6090799003|461199028|41001999006|15080799012|9112599006|19110799012|51005399006|23021999003|8060799015|440099028|3412199025|10035399007|40105399003|18061999006|3420499032|13041999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFJ0dThWdDg2U1F5R1F4c2RBa0lVVW8vNmQ2RGdHVUhRdWVhNlNNMzBYZXA2?=
 =?utf-8?B?Nm45OWZUVGh0VXhKV2ZjSWsrcEkrWHB4TlFYeGdENk9MK2dQVFloc2VnOVhC?=
 =?utf-8?B?UFlxYWJ4TzFzZ1NjY3hQUjhkNTFKZE1ESDdyS0xzdXJwVFVZMnlQYkVncmlr?=
 =?utf-8?B?a3lFaG1TcEZWdSsvbkRqWUwvWVdEYlphMnR6dUd2Qm4zMmQrQkhjeFdXeGtB?=
 =?utf-8?B?LzFvRVUyZkw1eUdaUVRJNFF1QXBseHRCS2piTE5KY2UxVkNPVmZEa1NCMTBL?=
 =?utf-8?B?YXcyZUhpSXBrSVV6NDFDTlBHQy9zejFlMXdjaU1CZGpQQWpNSlh0cnE2blJL?=
 =?utf-8?B?ekIvbmcxQU00ZzV3aGNRYVdQYlJSM29MRk0vSzkybWJ6NlRIS0NPZWI5N2g0?=
 =?utf-8?B?a1NKM3l0NVNZbjRtQmU1cVJ3bS9xeXRtVGcrTGZqUmtXbENyQmorWnRqSURK?=
 =?utf-8?B?MXRyc3NMZEMzdE83VGlHQ2M1bUVCSGZqQ3R0d2JuNWMwMzZHNGlFQ1ZwZDdI?=
 =?utf-8?B?NnhKRXF0bk5WUFdXS1JHZ3lGbHlIRFQ2Zk9DV0VoR2lNMi9GTVhwcXo3TXpr?=
 =?utf-8?B?YUI4TWh0cmw5bHQ2bllzaVJwQ3h2VnQ5cGsvTk9GWnZSWVpKc2IxSzk2dWRD?=
 =?utf-8?B?R2N4NStnbjRXRTRpZDNRdlo3K2RubnhBbEsyUWt3MkRudmEvbS9ya0ZpVzg3?=
 =?utf-8?B?b1krSno1ZVVDZDkxbTFFOVcrVG5Gb3l1SU4vdk05SVVBcXZzVng3dGY4czFW?=
 =?utf-8?B?d1J0U3Y2Qm91TUpCeEp4OEhzcW1md1h6L2Q4OFNzSXBnNFJtWkZob3MrczF5?=
 =?utf-8?B?Tk10dmNRblN1Z1d3eGR0enVUNW9rMWJmbkNsQjlQbkZ6TktYSHM2Q0V1NW5Q?=
 =?utf-8?B?eFZFRGZRS00xREliWXNNaDVYT2dsazNoMWdsUmZEZ3pjTDc4SGMvcFRGY3Rm?=
 =?utf-8?B?N2VFWlJXRm5LKzliZHdnZmMzTjA3VUFyWkhnMGl4UEJodDlRMmJ4TTh4aTFH?=
 =?utf-8?B?dm1uY0MwOGVvM2lIanFmVVZZK1NCdnJVYXc5MkljcXhGUXZiTm8wMFVqQ3VZ?=
 =?utf-8?B?M0hRU2RCWGxVakhHaWx1Q2tQUllIVFJRaXExNGlUUk8vaWFxMEFuR3BPZW1N?=
 =?utf-8?B?TE9rcVpabmVyanFrRzkwN3NETzVHcW1pbEMwZUlZVWp0WS9TcGp3VGh3dEIw?=
 =?utf-8?B?SlN5akM2NnZkcHAyeFBwSkkxS0Z2WkpaQXVQNTZDRnFuQU43ODA2dm9OZEk2?=
 =?utf-8?B?L0VySkN5RWtHREo4SW8vRlpZcURPdUVlS1UzY2RSNE1iMEV3S29DTTdKMG9X?=
 =?utf-8?B?YW9sTUVXYTFNckVGMmR0Y0lPVUJ2eGhWa3hWYm1pbUIzcllEeXJGcFZRYnlC?=
 =?utf-8?B?UHMxcytXSmJZZHFobHZQSCtwYW1ENkVqQXhaRUlsaWdNYXc4Tkx1QlQzdTdu?=
 =?utf-8?B?MWdMMVlaTzNhVUxaRy84M1hkMlBVVDJEREVVeldLOWYwbE9OR1piaThiRWxM?=
 =?utf-8?B?R3N0ZCt3aWdDaDM2YloxcUtTTG9WS01JV1l5MHB2TVJrS0NYMm1RaC92NHJC?=
 =?utf-8?B?RmNMZksxQkFibTFLVXc5ekV1SWRNdDIvR0tzeEhuaHYrRzIzc2wvL3hZUlVH?=
 =?utf-8?B?NXRQZk5nNEQ0QStqNmI0bFhyaU0vQldJUkFoWnMrZWpkekRTTFljYTd6TDh4?=
 =?utf-8?B?blUrZEJueEplRU9jdktJU2hpb3lQSmhQT0hGZzF3eEM2V0daNGp6c3hiVFNJ?=
 =?utf-8?B?OGY5aGIzdmx3ZFRBQmtKL0IyS05uTXlWQzVLb2luMWdWUUQ4TTlKYm54NnJI?=
 =?utf-8?B?czBoNnQvN0dXWkVNMnNKOTNCMWNPeEZrQ2JWS2dPWmRYcHRwU3U1VlJiZjJJ?=
 =?utf-8?B?eGtIeTlGQUh1NFNCdUZtemw2SWhVb3FGVHdLRnVXblBJTHVVSHZQZ3BwaHZh?=
 =?utf-8?Q?8asyJ4hSpellBpWt+H4Zcr1DgZDBrG01?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0hUNW4zV0Y5Yjk2THRjaHdNS1d6czFJMnZTUWJkYmx0cTZwZ3FBNDd2VGFr?=
 =?utf-8?B?K2QycDBIdEtlWjRNWS9QUTRuWk13bnhzMnAxTzNHb3FNeGdBUEk5UWhZSnN3?=
 =?utf-8?B?aE1XQWJNVlkzdEZySmRoZVkxS1JNZnFWVWFFQXVKU0JIMEFHdkFrRXhkd1Jx?=
 =?utf-8?B?ZTVlbEExR2RTd2Z5NmxaOHB5TXc0c2pvSExLalFzaFBJMS9KK050YmQwZ29M?=
 =?utf-8?B?ODFCN2w3eFg3emZ6bW9PdEdNTUdmUCticDczVHRXUERuL3ZwVUE2K1V3Ump5?=
 =?utf-8?B?a1IxN1Y0UFRyQmpsVGQ4clh6T0NneTY3TkRGdFlacktYSDFtNDRuWFVHYWlV?=
 =?utf-8?B?M3JHZ04xUXpoejZJVDVMdmk5RldYSlhQenQrOEgrbnE4TmFWTFcxWWR0cms0?=
 =?utf-8?B?TWJmYmErR2dqZkVWT3BMRmZ5MEpScFdlN0pLV1krWXhWTVN3ZnZDK3hGKzln?=
 =?utf-8?B?N2J0emdFeW5WSFBoQ2NSSmt5RHUrTXIrdjBIVjh1enZlQWlJRzh2dW1iOW5H?=
 =?utf-8?B?eEFSeFVrUHdKRFZZYXRkdThwZGRLdUw3cDhkMUgzUnFQMGV4MHA0ekRKZ3ha?=
 =?utf-8?B?TElWRzRJYmdGU2dpbUhLRGdXbjJqa20xYVcyeS91K0JyK3hiKzBrb1VMYndu?=
 =?utf-8?B?cDB0cVgxNittY1JUS0k1d3ovaXIyRmx6MDRyZ1NKcXdIRVNXQUhLaDd4Mm05?=
 =?utf-8?B?MTE4REdZN3lmN2d1OXl6RE12Y2gyNHJzblg3YUJxdHNQY0dUZUtnZ0ltRGRT?=
 =?utf-8?B?aTVWV0RraWY1ckg5Q1AyOGMzaCtwSmk4Z0hIdUNzTHBhVDVydk1BYzJxUTh3?=
 =?utf-8?B?dG1Yci9hRndUeEoxR0QzME1lN3RnZW44d1hreis0VXVNeFJvTklrd1QzUmtO?=
 =?utf-8?B?dUp5WEhkTDVrS2poamVSSWs2YW1MSzRqQkRvK2N5c3hNODBkUGZmRkw5WEJ2?=
 =?utf-8?B?ZVE2cjEydFNKdHFwQ05QZkJvNXpjUWlkNmpna0c5bUdYeWwwOWhnTDVKL1Y5?=
 =?utf-8?B?VnNEZVlLU3Z5dkJFZnNudFpoc2ovdzJlbVFvajYzczFNMkdBVWxHM2ppeVdo?=
 =?utf-8?B?YzBuNmVvbVdlRkN2Y2kyeUlrQ0R1R2VmWkNtUGIxVXFTbGFQUUZ2VDY1WUhP?=
 =?utf-8?B?c0lOUGloNnZld2ZKdXFNQU5CVjVibHJ1SktkYmc0VGh0QTdVZWxjYTJkaTFE?=
 =?utf-8?B?RXZwTjJMYnRzaFZ2UU1jbEdoYk9jT09pUzFsUmlDbFV3dVljbExNNlh5VVFt?=
 =?utf-8?B?Vi85dU56c0luVURDR0FYM0lRTFFjMVJ1RFYvcWN2RFNuRDRxNmUzMzZITGtu?=
 =?utf-8?B?UFBxbS9CY2k0UGxtUDlQT0c0bmM1NlF6R2lnRDBCUHBsOFJuYkdLemxYMVFl?=
 =?utf-8?B?Z3VmdWdrRTY1UHhFKzFMSFhBbzRhRk82ZmI5NmNzK1FkTStvdmZhdFFuOFJE?=
 =?utf-8?B?bjJHUEk5UDVEWVJ2S2E3ZXYyMXlCNlpOYzA0aGNZK1RleHB2MGdYZ1psVTZa?=
 =?utf-8?B?dDB3MGZiL2k3NXA3WGgzci9HbnorQnFWd1pzZlQxMi9oRTB6cWhHZVpQaUdL?=
 =?utf-8?B?OWQzSmtsZVBoamJEWkZDcDFrcFN5Y3Ftcy9oT2VnU1FZUXNuMXpQbjRsalEy?=
 =?utf-8?B?MTFZOSthVzdNVSs2RWJvY2NNbWRDNlFmV25jRXFPRk10QXJHS1JlRTVaZGhm?=
 =?utf-8?B?d0libmRhem1zUTZNRVVvUFNHZzlTUHFGL2lJeWh2OFpESVk5a05yczNieGJO?=
 =?utf-8?B?UXNvMVRreFluRS9SR3hkblR1ZS9zL3JMUkhacTAyM0VZb1gweVZNaHdaSHMx?=
 =?utf-8?B?ZkErNzhYdjBTc1NoTnBnZTlsSjk4KzRCdnI2Q3NDNnVpWXZRT0ZxRGxZem9V?=
 =?utf-8?B?R2JxdHRZd1VHZFhxWHExcW9jVXhqTW5LRzEwUkgxNTI2MGdtQ1pLMS9mREl1?=
 =?utf-8?B?UDdDNWFKbHFIYy9rekVWd2o4bSsrelVwcndiMUd6aXorWU1ZWXN1Wk5ETmZT?=
 =?utf-8?Q?U2g03BL4w9L+FHRYci5oiyYs48vwtE=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493f9bc0-2421-40ab-73f3-08de450931b5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5520.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 05:31:32.5402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB7679
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/27/25 9:22 AM, Chao Yu via Linux-f2fs-devel wrote: >
 On 12/26/2025 11:39 AM, Yongpeng Yang wrote: >> On 12/26/25 09:52, Chao Yu
 via Linux-f2fs-devel wrote: >>> On 12/25/2025 8:59 PM, Yongpeng Ya [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.66.51 listed in wl.mailspike.net]
X-Headers-End: 1vZMtx-0001Ey-JH
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: return immediately after
 submitting the specified folio in __submit_merged_write_cond
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMjcvMjUgOToyMiBBTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToK
PiBPbiAxMi8yNi8yMDI1IDExOjM5IEFNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+PiBPbiAxMi8y
Ni8yNSAwOTo1MiwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+IE9uIDEy
LzI1LzIwMjUgODo1OSBQTSwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+PiBGcm9tOiBZb25ncGVu
ZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+Pgo+Pj4+IGYyZnNfZm9saW9fd2Fp
dF93cml0ZWJhY2sgZW5zdXJlcyB0aGUgZm9saW8gd3JpdGUgaXMgc3VibWl0dGVkIHRvIHRoZQo+
Pj4KPj4+IEFjdHVhbGx5LCBfX3N1Ym1pdF9tZXJnZWRfd3JpdGVfY29uZCgpIHdhcyBjYWxsZWQg
ZnJvbSBtYW55IG90aGVyIAo+Pj4gcGxhY2VzLAo+Pj4gZm9yIHRob3NlIHNjZW5hcmlvLCB3ZSBj
YW4gbm90IGVuc3VyZSB3aGV0aGVyIHRoZSBEQVRBIG9yIE5PREUgdHlwZSAKPj4+IHBhZ2VzCj4+
PiB3ZXJlIGNhY2hlZCBpbiBvbmUgYmlvIGNhY2hlIG9yIG5vdCwgc28gd2UgZGVjaWRlIHRvIHN1
Ym1pdCBhbGwgCj4+PiBjYWNoZWQgYmlvcwo+Pj4gdy8gREFUQSBvciBOT0RFIHR5cGUuCj4+Pgo+
Pj4+IGJsb2NrIGxheWVyIHZpYSBfX3N1Ym1pdF9tZXJnZWRfd3JpdGVfY29uZCwgdGhlbiB3YWl0
cyBmb3IgdGhlIGZvbGlvIHRvCj4+Pj4gY29tcGxldGUuIE90aGVyIEkvTyBzdWJtaXNzaW9ucyBh
cmUgaXJyZWxldmFudCB0bwo+Pj4+IGYyZnNfZm9saW9fd2FpdF93cml0ZWJhY2suIFRodXMsIGlm
IHRoZSBmb2xpbyB3cml0ZSBiaW8gaXMgYWxyZWFkeQo+Pj4KPj4+IEZvciBmMmZzX2ZvbGlvX3dh
aXRfd3JpdGViYWNrKCkgY2FzZSwgSSBndWVzcyB5b3UgY2FuIG9wdGltaXplIGl0Cj4+PiBzZXBh
cmF0ZWx5LAo+Pj4gbWF5YmUgcGFzc2luZyBhIHBhcmFtZXRlciB0byBfX3N1Ym1pdF9tZXJnZWRf
d3JpdGVfY29uZCgpIGFzIGEgaGludD8KPj4KPj4gQ3VycmVudGx5LCBvbmx5IHRoZSBjYWxsIGNo
YWluIGYyZnNfZm9saW9fd2FpdF93cml0ZWJhY2sKPj4gLT4gZjJmc19zdWJtaXRfbWVyZ2VkX3dy
aXRlX2NvbmQtPl9fc3VibWl0X21lcmdlZF93cml0ZV9jb25kIHBhc3NlcyBhCj4+IG5vbi1OVUxM
IGZvbGlvIHdpdGggYSBOVUxMIGlub2RlLiBXaGVuIHRoZSByZXR1cm4gdmFsdWUgb2YKPj4gX19o
YXNfbWVyZ2VkX3BhZ2UgaXMgdHJ1ZSBhbmQgdGhlIGZvbGlvIGlzIG5vbi1OVUxMLCBpdCBpbmRp
Y2F0ZXMgdGhlCj4+IGNhbGwgaXMgZnJvbSBmMmZzX2ZvbGlvX3dhaXRfd3JpdGViYWNrLiBJbmRl
ZWQsIHRoaXMgaXMgdW5jbGVhci4KPj4KPj4gVGhlIGZvcmNlIHBhcmFtZXRlciBzZWVtcyByZWR1
bmRhbnQsIHdoZXJlIGZvcmNlID0gdHJ1ZSBpbXBsaWVzIGBpbm9kZQo+PiA9PSBOVUxMICYmIGZv
bGlvID09IE5VTEwgJiYgaW5vID09IDBgIGlzIHRydWUsIGFuZCBmb3JjZSA9IGZhbHNlIGltcGxp
ZXMKPj4gYGlub2RlICE9IE5VTEwgfHwgZm9saW8gIT0gTlVMTCB8fCBpbm8gIT0gMGAgaXMgdHJ1
ZS4KPj4KPj4gSG93IGFib3V0IHJlbW92aW5nIHRoZSBmb3JjZSBwYXJhbWV0ZXIgYW5kIGFkZGlu
ZyBhIGBib29sIHdyaXRlYmFja2AKPj4gcGFyYW1ldGVyIHRvIGluZGljYXRlIGNhbGxzIGZyb20g
ZjJmc19mb2xpb193YWl0X3dyaXRlYmFjaz8KPiAKPiBTdXJlLCBjYW4gd2UgY2xlYW4gdXAgZm9y
Y2UgcGFyYW1ldGVyIGluIHNlcGFyYXRlZCBwYXRjaD8KPiAKCk9LLCBJJ2xsIGNsZWFuIGl0IHVw
IGFuZCBvcHRtaXplIGYyZnNfZm9saW9fd2FpdF93cml0ZWJhY2sgaW4gdjIgcGF0Y2guCgpUaGFu
a3MKWW9uZ3BlbmcsCgo+IFRoYW5rcywKPiAKPj4KPj4gVGhhbmtzCj4+IFlvbmdwZW5nLAo+Pgo+
Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4gc3VibWl0dGVkLCB0aGUgZnVuY3Rpb24gY2FuIHJldHVy
biBpbW1lZGlhdGVseS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlh
bmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgwqAgZnMvZjJmcy9kYXRhLmMg
fCA2ICsrKysrLQo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJm
cy9kYXRhLmMKPj4+PiBpbmRleCAxMmJmNGI2ZTAwNzUuLmM3NDMzNTJiNjg2ZCAxMDA2NDQKPj4+
PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4gQEAg
LTY3OCw4ICs2NzgsMTIgQEAgc3RhdGljIHZvaWQgX19zdWJtaXRfbWVyZ2VkX3dyaXRlX2NvbmQo
c3RydWN0Cj4+Pj4gZjJmc19zYl9pbmZvICpzYmksCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXQgPSBfX2hhc19tZXJnZWRfcGFnZShpby0+YmlvLCBpbm9kZSwgZm9saW8sIGlu
byk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3VwX3JlYWQoJmlvLT5p
b19yd3NlbSk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+IC3CoMKgwqDCoMKgwqDC
oCBpZiAocmV0KQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBfX2YyZnNfc3VibWl0X21lcmdlZF93cml0ZShzYmksIHR5cGUs
IHRlbXApOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGRvbid0IG5lZWQgdG8gc3Vi
bWl0IG90aGVyIHR5cGVzIG9mIGJpby4gKi8KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoZm9saW8pCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+
PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqAgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFRPRE86
IHVzZSBIT1QgdGVtcCBvbmx5IGZvciBtZXRhIHBhZ2VzIG5vdy4gKi8KPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAodHlwZSA+PSBNRVRBKQo+Pj4KPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+
Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo+Pgo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
